import SwiftUI
import Supabase
import PostgREST

struct DetailView: View {
    let posting: Posting
    @State private var seller: AppUser?
    @State private var isFavorited = false
    @State private var loading = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                postingRemoteImage(urlString: posting.imageUrl)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(posting.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            toggleFavorite()
                        }) {
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .font(.title2)
                        }
                    }

                    Text("$\(String(format: "%.2f", posting.price ?? 0.0))")
                        .font(.title3)
                        .fontWeight(.semibold)

                    if let seller = seller {
                        HStack {
                            AsyncImage(url: URL(string: seller.image_url)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())

                            Text("Sold by \(seller.username)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }

                    Divider()

                    Text(posting.description ?? "No description available.")
                        .padding(.top, 5)

                    NavigationLink(destination: Text("Messaging view here")) {
                        Text("Message Seller")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.top, 20)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchSeller()
            checkIfFavorited()
        }
    }

    private func fetchSeller() {
        Task {
            do {
                let result = try await SupabaseManager.shared.client
                    .from("users")
                    .select()
                    .eq("id", value: posting.userId)
                    .single()
                    .execute()

                let seller = try JSONDecoder().decode(AppUser.self, from: result.data)
                self.seller = seller
            } catch {
                print("Failed to fetch seller:", error)
            }
        }
    }

    private func checkIfFavorited() {
        Task {
            do {
                guard let userId = SupabaseManager.shared.client.auth.currentUser?.id else { return }

                let result = try await SupabaseManager.shared.client
                    .from("favorites")
                    .select()
                    .eq("user_id", value: userId.uuidString)
                    .eq("post_id", value: posting.id)
                    .execute()

                let favorites = try JSONDecoder().decode([Favorite].self, from: result.data)
                self.isFavorited = !favorites.isEmpty
            } catch {
                self.isFavorited = false
                print("Error checking favorite:", error.localizedDescription)
            }
        }
    }

    private func toggleFavorite() {
        Task {
            guard let userId = SupabaseManager.shared.client.auth.currentUser?.id else { return }

            do {
                if isFavorited {
                    // Remove favorite
                    try await SupabaseManager.shared.client
                        .from("favorites")
                        .delete()
                        .eq("user_id", value: userId.uuidString)
                        .eq("post_id", value: posting.id)
                        .execute()
                    isFavorited = false
                } else {
                    // Add favorite
                    let newFavorite = NewFavorite(user_id: userId.uuidString, post_id: posting.id)
                    try await SupabaseManager.shared.client
                        .from("favorites")
                        .insert(newFavorite)
                        .execute()
                    isFavorited = true
                }
            } catch {
                print("Failed to toggle favorite:", error.localizedDescription)
            }
        }
    }
}

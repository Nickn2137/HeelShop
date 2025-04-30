import SwiftUI

struct ShopTabView: View {
    @State private var showCreateListing = false
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var accountViewModel = AccountViewModel()

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        VStack {
            ZStack {
                TabView {
                    Homeview(homeViewModel: homeViewModel)
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    DiscoverView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Discover")
                        }
                    Spacer()
                    MessageView()
                        .tabItem {
                            Image(systemName: "message")
                            Text("Messages")
                        }
                    AccountView(viewModel: accountViewModel)
                        .tabItem {
                            Image(systemName: "person")
                            Text("Account")
                        }
                }
                .accentColor(.tarheel)
                // Custom Plus Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showCreateListing = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundColor(.tarheel)
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 4, x: 0, y: 2)
                                )
                        }
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $showCreateListing) {
                CreateListingView(homeViewModel: homeViewModel, accountViewModel: accountViewModel)
            }
        }
    }
}

#Preview {
    ShopTabView()
}

import SwiftUI

struct ShopTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        }
    
    var body: some View {
        VStack {
            ZStack {
                TabView {
                    Homeview()
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
                    AccountView()
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
                            // TODO
                            print("Plus button tapped")
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
        }
    }
}

#Preview {
    ShopTabView()
}

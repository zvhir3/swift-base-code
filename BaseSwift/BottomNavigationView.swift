import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            FeatureView()
                .tabItem {
                    Label("Feature", systemImage: "star")
                }
            
            InboxView()
                .tabItem {
                    Label("Inbox", systemImage: "envelope")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    BottomNavigationView()
}

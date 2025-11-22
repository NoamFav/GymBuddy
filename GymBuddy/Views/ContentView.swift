import SwiftUI

// MARK: - Tab Selection Enum
enum AppTab {
    case dashboard
    case categories
    case focus
    case gallery
}

// MARK: - Root with Tabs (Dashboard as Main)
struct ContentView: View {
    @State private var selectedTab: AppTab = .dashboard
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // TAB 1 – Dashboard (Main screen with stats and overview)
            DashboardView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Dashboard", systemImage: "house.fill")
                }
                .tag(AppTab.dashboard)
            
            // TAB 2 – Categories (6 quiz categories)
            CategoriesHomeView()
                .tabItem {
                    Label("Categories", systemImage: "square.grid.2x2")
                }
                .tag(AppTab.categories)

            // TAB 3 – Training Focus (Advanced/Image-based categories)
            AdvancedCategoriesView()
                .tabItem {
                    Label("Focus", systemImage: "line.3.horizontal.decrease.circle")
                }
                .tag(AppTab.focus)

            // TAB 4 – Gallery (Exercise images + names)
            ExerciseGalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo.on.rectangle")
                }
                .tag(AppTab.gallery)
        }
        .tint(.white) // Makes selected tab icons white
    }
}

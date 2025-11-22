import SwiftUI

// MARK: - Root with Tabs (Dashboard as Main)

struct ContentView: View {
    var body: some View {
        TabView {
            // TAB 1 – Dashboard (Main screen with stats and overview)
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house.fill")
                }
            
            // TAB 2 – Categories (6 quiz categories)
            CategoriesHomeView()
                .tabItem {
                    Label("Categories", systemImage: "square.grid.2x2")
                }

            // TAB 3 – Training Focus (Advanced/Image-based categories)
            AdvancedCategoriesView()
                .tabItem {
                    Label("Focus", systemImage: "line.3.horizontal.decrease.circle")
                }

            // TAB 4 – Gallery (Exercise images + names)
            ExerciseGalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo.on.rectangle")
                }
        }
        .tint(.white) // Makes selected tab icons white
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

import SwiftUI

// MARK: - Root with Tabs

struct ContentView: View {
    var body: some View {
        TabView {
            // TAB 1 – your current main screen (6 categories)
            CategoriesHomeView()
                .tabItem {
                    Label("Categories", systemImage: "square.grid.2x2")
                }

            // TAB 2 – advanced / Claude-style categories (structure only for now)
            AdvancedCategoriesView()
                .tabItem {
                    Label("Focus", systemImage: "line.3.horizontal.decrease.circle")
                }

            // TAB 3 – gallery of exercise images + names
            ExerciseGalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo.on.rectangle")
                }
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

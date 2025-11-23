import SwiftUI


struct ExerciseGalleryView: View {
    @State private var selectedFilter: MuscleFilter = .all
    @State private var searchText: String = ""

    // Base grouping by category
    private var groupedExercises: [ExerciseCategory: [Exercise]] {
        let base = Dictionary(grouping: ExerciseData.all) { exercise in
            category(for: exercise)
        }

        var sorted: [ExerciseCategory: [Exercise]] = [:]
        for (key, value) in base {
            sorted[key] = value.sorted { $0.name < $1.name }
        }
        return sorted
    }

    // Apply category filter + search on top
    private var filteredGroupedExercises: [ExerciseCategory: [Exercise]] {
        let search = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let targetCategory = selectedFilter.mappedCategory

        var result: [ExerciseCategory: [Exercise]] = [:]

        for (category, items) in groupedExercises {
            // If a category is selected, skip others
            if let target = targetCategory, category != target {
                continue
            }

            let filteredItems: [Exercise]
            if search.isEmpty {
                filteredItems = items
            } else {
                filteredItems = items.filter { $0.name.lowercased().contains(search) }
            }

            if !filteredItems.isEmpty {
                result[category] = filteredItems
            }
        }

        return result
    }

    private let columns = [
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackground()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Exercise Gallery")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding(.top, 24)

                        Text("Filter by muscle group or search by name to quickly find the exercise you want to study.")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.white.opacity(0.6))

                        // Segmented control
                        Picker("Muscle Group", selection: $selectedFilter) {
                            ForEach(MuscleFilter.allCases) { filter in
                                Text(filter.rawValue).tag(filter)
                            }
                        }
                        .pickerStyle(.segmented)

                        // Sections by category
                        ForEach(ExerciseCategory.allCases) { category in
                            if let items = filteredGroupedExercises[category],
                               !items.isEmpty {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(category.title)
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 2)

                                    LazyVGrid(columns: columns, spacing: 16) {
                                        ForEach(items) { exercise in
                                            ExerciseGalleryCard(exercise: exercise)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle("Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: "Search exercises"
            )
        }
    }
}

#Preview {
    ExerciseGalleryView()
}

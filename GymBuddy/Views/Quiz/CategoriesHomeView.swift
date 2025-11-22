import SwiftUI

struct CategoriesHomeView: View {
    @ObservedObject private var quizManager = QuizManager.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Dynamic gradient background
                GradientBackground()
                
                // Subtle ambient orbs (less prominent than before)
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.4, green: 0.2, blue: 0.9).opacity(0.2),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 200
                        )
                    )
                    .frame(width: 350, height: 350)
                    .blur(radius: 80)
                    .offset(x: -150, y: -200)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.8, green: 0.3, blue: 0.9).opacity(0.15),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 180
                        )
                    )
                    .frame(width: 300, height: 300)
                    .blur(radius: 70)
                    .offset(x: 150, y: 400)
                
                // Content based on loading state
                if quizManager.isLoading {
                    VStack(spacing: 20) {
                        ProgressView()
                            .scaleEffect(1.5)
                            .tint(.white)
                        
                        Text("Loading Questions...")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                } else if let error = quizManager.errorMessage {
                    VStack(spacing: 20) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 60, weight: .semibold))
                            .foregroundStyle(.red)
                        
                        Text("Error Loading Quiz Data")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                        
                        Text(error)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 28) {
                            // Header section
                            VStack(spacing: 12) {
                                Text("Quiz Categories")
                                    .font(.system(size: 32, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                                
                                Text("Test your knowledge across 6 different fitness topics")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundStyle(.white.opacity(0.65))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 32)
                            }
                            .padding(.top, 20)
                            
                            // Stats card (optional - shows total questions available)
                            HStack(spacing: 20) {
                                StatBadge(
                                    icon: "questionmark.circle.fill",
                                    value: "\(quizManager.allQuestions.count)",
                                    label: "Questions",
                                    gradient: [Color(red: 0.3, green: 0.6, blue: 0.9), Color(red: 0.5, green: 0.75, blue: 0.95)]
                                )
                                
                                StatBadge(
                                    icon: "square.grid.2x2.fill",
                                    value: "\(QuizCategory.allCases.count)",
                                    label: "Categories",
                                    gradient: [Color(red: 0.8, green: 0.2, blue: 0.3), Color(red: 0.95, green: 0.4, blue: 0.5)]
                                )
                                
                                StatBadge(
                                    icon: "brain.head.profile",
                                    value: "10",
                                    label: "Per Quiz",
                                    gradient: [Color(red: 0.5, green: 0.3, blue: 0.8), Color(red: 0.65, green: 0.45, blue: 0.9)]
                                )
                            }
                            .padding(.horizontal, 20)
                            
                            // Category grid
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                ForEach(QuizCategory.allCases) { category in
                                    NavigationLink(destination: QuizView(category: category)) {
                                        CategoryCard(category: category)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Stat Badge Component
struct StatBadge: View {
    let icon: String
    let value: String
    let label: String
    let gradient: [Color]
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(
                    LinearGradient(
                        colors: gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            
            Text(label)
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.08),
                                Color.white.opacity(0.04)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.ultraThinMaterial)
                    )
                    .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
            }
        )
    }
}

#Preview {
    CategoriesHomeView()
}

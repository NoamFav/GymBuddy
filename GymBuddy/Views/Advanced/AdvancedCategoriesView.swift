import SwiftUI

struct AdvancedCategoriesView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackground()

                VStack(spacing: 24) {
                    Text("Training Focus")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 24)

                    Text("Master exercises through image-based quizzes. Identify muscles, movements, and exercise names.")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.white.opacity(0.6))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)

                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(AdvancedQuizCategory.allCases) { advanced in
                                NavigationLink(destination: AdvancedQuizView(category: advanced)) {
                                    VStack(spacing: 12) {
                                        ZStack {
                                            Circle()
                                                .fill(
                                                    LinearGradient(
                                                        colors: advanced.gradient,
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    )
                                                )
                                                .frame(width: 60, height: 60)
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                                                )
                                                .shadow(color: advanced.gradient[0].opacity(0.4), radius: 15, y: 8)

                                            Image(systemName: advanced.icon)
                                                .font(.system(size: 26, weight: .semibold))
                                                .foregroundStyle(.white)
                                        }

                                        Text(advanced.rawValue)
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundStyle(.white)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)

                                        Text("15 questions")
                                            .font(.system(size: 11, weight: .medium))
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 22)
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
                                                RoundedRectangle(cornerRadius: 22)
                                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                            )
                                            .background(
                                                RoundedRectangle(cornerRadius: 22)
                                                    .fill(.ultraThinMaterial)
                                            )
                                            .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationTitle("Focus")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AdvancedCategoriesView()
}

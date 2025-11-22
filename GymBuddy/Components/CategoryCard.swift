import SwiftUI

struct CategoryCard: View {
    let category: QuizCategory
    @State private var isPressed = false
    
    var body: some View {
        VStack(spacing: 16) {
            // Icon with gradient
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: category.gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 64, height: 64)
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                    )
                    .shadow(color: category.gradient[0].opacity(0.4), radius: 15, y: 8)
                
                Image(systemName: category.icon)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundStyle(.white)
            }
            
            VStack(spacing: 6) {
                Text(category.rawValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Text("\(QuizData.allQuestions.filter { $0.category == category }.count) questions")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.white.opacity(0.5))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 28)
        .background(
            ZStack {
                // Liquid glass background
                RoundedRectangle(cornerRadius: 24)
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
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.3),
                                        Color.white.opacity(0.1)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.ultraThinMaterial)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
            }
        )
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
    }
}

#Preview("Machines") {
    ZStack {
        Color(red: 0.1, green: 0.05, blue: 0.2)
            .ignoresSafeArea()
        CategoryCard(category: .machines)
            .padding()
    }
}

#Preview("Fun Facts") {
    ZStack {
        Color(red: 0.1, green: 0.05, blue: 0.2)
            .ignoresSafeArea()
        CategoryCard(category: .funFacts)
            .padding()
    }
}

#Preview("Science") {
    ZStack {
        Color(red: 0.1, green: 0.05, blue: 0.2)
            .ignoresSafeArea()
        CategoryCard(category: .science)
            .padding()
    }
}

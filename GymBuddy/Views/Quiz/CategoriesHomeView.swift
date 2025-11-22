import SwiftUI

struct CategoriesHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Dynamic gradient background
                GradientBackground()
                
                // Ambient light orbs
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.4, green: 0.2, blue: 0.9).opacity(0.3),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 200
                        )
                    )
                    .frame(width: 400, height: 400)
                    .blur(radius: 80)
                    .offset(x: -150, y: -250)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.8, green: 0.3, blue: 0.9).opacity(0.25),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 180
                        )
                    )
                    .frame(width: 350, height: 350)
                    .blur(radius: 70)
                    .offset(x: 180, y: 350)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.2, green: 0.6, blue: 0.9).opacity(0.2),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 150
                        )
                    )
                    .frame(width: 300, height: 300)
                    .blur(radius: 60)
                    .offset(x: 0, y: 500)
                
                VStack(spacing: 0) {
                    // Header
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(red: 0.8, green: 0.2, blue: 0.3),
                                            Color(red: 0.95, green: 0.4, blue: 0.5)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.2), lineWidth: 2)
                                )
                                .shadow(color: Color(red: 0.8, green: 0.2, blue: 0.3).opacity(0.5), radius: 30, y: 10)
                            
                            Image(systemName: "figure.strengthtraining.traditional")
                                .font(.system(size: 45, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        
                        Text("GymBuddy")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.white, Color.white.opacity(0.8)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        Text("Test Your Fitness Knowledge")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.white.opacity(0.6))
                            .tracking(2)
                            .textCase(.uppercase)
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 40)
                    
                    // Category grid
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(QuizCategory.allCases) { category in
                                NavigationLink(destination: QuizView(category: category)) {
                                    CategoryCard(category: category)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                    }
                }
            }
        }
    }
}

#Preview {
    CategoriesHomeView()
}

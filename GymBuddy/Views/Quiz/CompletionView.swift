import SwiftUI

struct CompletionView: View {
    let score: Int
    let total: Int
    let category: QuizCategory
    let onDismiss: () -> Void
    
    var percentage: Double {
        guard total > 0 else { return 0 }
        return Double(score) / Double(total) * 100
    }
    
    var performanceIcon: String {
        switch percentage {
        case 90...100: return "trophy.fill"
        case 70..<90: return "star.fill"
        case 50..<70: return "hand.thumbsup.fill"
        default: return "book.fill"
        }
    }
    
    var performanceMessage: String {
        switch percentage {
        case 90...100: return "Outstanding!"
        case 70..<90: return "Great Work!"
        case 50..<70: return "Good Effort!"
        default: return "Keep Learning!"
        }
    }
    
    var performanceColor: [Color] {
        switch percentage {
        case 90...100: return [Color(red: 0.9, green: 0.6, blue: 0.1), Color(red: 0.95, green: 0.75, blue: 0.3)]
        case 70..<90: return [Color(red: 0.3, green: 0.7, blue: 0.9), Color(red: 0.5, green: 0.8, blue: 0.95)]
        case 50..<70: return [Color(red: 0.5, green: 0.3, blue: 0.8), Color(red: 0.65, green: 0.45, blue: 0.9)]
        default: return [Color(red: 0.8, green: 0.4, blue: 0.4), Color(red: 0.9, green: 0.5, blue: 0.5)]
        }
    }
    
    var body: some View {
        ZStack {
            // Dynamic gradient background
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.05, blue: 0.15),
                    Color(red: 0.1, green: 0.05, blue: 0.2),
                    Color(red: 0.15, green: 0.1, blue: 0.25)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Celebration orbs
            ForEach(0..<5) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                performanceColor[index % 2].opacity(0.3),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: CGFloat(120 + index * 20)
                        )
                    )
                    .frame(width: CGFloat(200 + index * 30), height: CGFloat(200 + index * 30))
                    .blur(radius: CGFloat(50 + index * 10))
                    .offset(
                        x: CGFloat([-120, 130, -80, 100, 0][index]),
                        y: CGFloat([-200, 250, 100, -150, 300][index])
                    )
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                // Main completion card
                VStack(spacing: 28) {
                    // Trophy icon
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: performanceColor,
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 120, height: 120)
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.3), lineWidth: 2)
                            )
                            .shadow(color: performanceColor[0].opacity(0.6), radius: 35, y: 15)
                        
                        Image(systemName: performanceIcon)
                            .font(.system(size: 55, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    
                    VStack(spacing: 12) {
                        Text(performanceMessage)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        
                        Text("QUIZ COMPLETE")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(.white.opacity(0.5))
                            .tracking(2)
                    }
                    
                    // Score display
                    VStack(spacing: 16) {
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Text("\(score)")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            
                            Text("/ \(total)")
                                .font(.system(size: 40, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        
                        // Percentage badge
                        HStack(spacing: 6) {
                            Image(systemName: "percent")
                                .font(.system(size: 16, weight: .bold))
                            
                            Text("\(Int(percentage))")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 28)
                        .padding(.vertical, 14)
                        .background(
                            ZStack {
                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.15),
                                                Color.white.opacity(0.08)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                                    )
                                    .background(
                                        Capsule()
                                            .fill(.ultraThinMaterial)
                                    )
                            }
                        )
                    }
                    
                    // Performance breakdown
                    HStack(spacing: 24) {
                        VStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundStyle(Color.green)
                            
                            Text("\(score)")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            
                            Text("Correct")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.1),
                                                Color.white.opacity(0.05)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.ultraThinMaterial)
                                    )
                            }
                        )
                        
                        VStack(spacing: 8) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundStyle(Color.red)
                            
                            Text("\(total - score)")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            
                            Text("Incorrect")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.1),
                                                Color.white.opacity(0.05)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.ultraThinMaterial)
                                    )
                            }
                        )
                    }
                }
                .padding(.vertical, 44)
                .padding(.horizontal, 36)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 36)
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
                                RoundedRectangle(cornerRadius: 36)
                                    .stroke(
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.3),
                                                Color.white.opacity(0.1)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1.5
                                    )
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 36)
                                    .fill(.ultraThinMaterial)
                            )
                            .shadow(color: .black.opacity(0.4), radius: 30, y: 15)
                    }
                )
                .padding(.horizontal, 24)
                
                Spacer()
                
                // Action buttons
                VStack(spacing: 14) {
                    
                    Button(action: onDismiss) {
                        HStack(spacing: 10) {
                            Image(systemName: "house.fill")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text("Back to Categories")
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                        }
                        .foregroundStyle(.white.opacity(0.9))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.1),
                                                Color.white.opacity(0.05)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.ultraThinMaterial)
                                    )
                            }
                        )
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    CompletionView(
        score: 9,
        total: 10,
        category: .funFacts,
        onDismiss: { print("Dismissed") }
    )
}

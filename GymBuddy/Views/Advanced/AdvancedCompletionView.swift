import SwiftUI

struct AdvancedCompletionView: View {
    let score: Int
    let total: Int
    let category: AdvancedQuizCategory
    let onDismiss: () -> Void
    
    @State private var hasPlayedSound = false
    
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
        case 70..<90: return category.gradient
        case 50..<70: return [Color(red: 0.5, green: 0.3, blue: 0.8), Color(red: 0.65, green: 0.45, blue: 0.9)]
        default: return [Color(red: 0.8, green: 0.4, blue: 0.4), Color(red: 0.9, green: 0.5, blue: 0.5)]
        }
    }
    
    var body: some View {
        ZStack {
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
            
            VStack(spacing: 0) {
                Spacer()
                
                VStack(spacing: 28) {
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
                    
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text("\(score)")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        
                        Text("/ \(total)")
                            .font(.system(size: 40, weight: .semibold, design: .rounded))
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    
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
                        .glassCard(cornerRadius: 20)
                        
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
                        .glassCard(cornerRadius: 20)
                    }
                }
                .padding(.vertical, 44)
                .padding(.horizontal, 36)
                .glassCard(cornerRadius: 36)
                .padding(.horizontal, 24)
                
                Spacer()
                
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
                    .glassCard(cornerRadius: 20)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            if !hasPlayedSound {
                hasPlayedSound = true
                SoundManager.shared.playCompletionSound(percentage: percentage)
            }
        }
    }
}

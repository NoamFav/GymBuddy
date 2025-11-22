import SwiftUI

struct RecentQuizRow: View {
    let category: String
    let score: Int
    let total: Int
    let date: String
    let gradient: [Color]
    
    var accuracy: Double {
        Double(score) / Double(total) * 100
    }
    
    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 12, height: 12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(category)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text(date)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.5))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(score)/\(total)")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Text(String(format: "%.0f%%", accuracy))
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(accuracy >= 80 ? Color.green : (accuracy >= 60 ? Color.orange : Color.red))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
}

import SwiftUI

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let gradient: [Color]
    let action: () -> Void
    
    @State private var isPressed = false
    
    var backgroundColor: LinearGradient {
        if let isCorrect = isCorrect {
            if isCorrect {
                return LinearGradient(
                    colors: [Color.green.opacity(0.2), Color.green.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            } else if isSelected {
                return LinearGradient(
                    colors: [Color.red.opacity(0.2), Color.red.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
        return LinearGradient(
            colors: [Color.white.opacity(0.08), Color.white.opacity(0.04)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var borderColor: Color {
        if let isCorrect = isCorrect {
            return isCorrect ? Color.green : (isSelected ? Color.red : Color.white.opacity(0.2))
        }
        return isSelected ? Color.white.opacity(0.5) : Color.white.opacity(0.2)
    }
    
    var icon: String? {
        if let isCorrect = isCorrect {
            return isCorrect ? "checkmark.circle.fill" : (isSelected ? "xmark.circle.fill" : nil)
        }
        return nil
    }
    
    var body: some View {
        Button(action: {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
                action()
            }
        }) {
            HStack(spacing: 14) {
                Text(text)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(2)
                
                Spacer()
                
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(isCorrect == true ? Color.green : Color.red)
                }
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(backgroundColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(borderColor, lineWidth: 1.5)
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                        )
                        .shadow(
                            color: isSelected ? borderColor.opacity(0.4) : Color.black.opacity(0.2),
                            radius: isSelected ? 15 : 8,
                            y: isSelected ? 6 : 4
                        )
                }
            )
        }
        .scaleEffect(isPressed ? 0.97 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        .disabled(isCorrect != nil)
    }
}

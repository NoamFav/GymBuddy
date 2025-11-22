import SwiftUI

struct SoundToggleButton: View {
    @ObservedObject var soundManager = SoundManager.shared
    
    var body: some View {
        Button(action: {
            soundManager.toggleSound()
        }) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: soundManager.isSoundEnabled ?
                                    [Color.green, Color.green.opacity(0.8)] :
                                    [Color.gray, Color.gray.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                        .shadow(color: soundManager.isSoundEnabled ? Color.green.opacity(0.4) : Color.gray.opacity(0.2), radius: 10, y: 5)
                    
                    Image(systemName: soundManager.isSoundEnabled ? "speaker.wave.2.fill" : "speaker.slash.fill")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(.white)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sound Effects")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Text(soundManager.isSoundEnabled ? "Enabled" : "Disabled")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                Spacer()
                
                // Toggle switch indicator
                ZStack {
                    Capsule()
                        .fill(soundManager.isSoundEnabled ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                        .frame(width: 50, height: 30)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 24, height: 24)
                        .offset(x: soundManager.isSoundEnabled ? 10 : -10)
                        .animation(.spring(response: 0.3), value: soundManager.isSoundEnabled)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        Color(red: 0.1, green: 0.05, blue: 0.2)
            .ignoresSafeArea()
        
        SoundToggleButton()
            .padding()
    }
}

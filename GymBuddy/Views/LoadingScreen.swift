import SwiftUI

struct LoadingScreen: View {
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0
    @State private var glowIntensity: Double = 0
    @State private var rotationAngle: Double = 0
    @State private var pulseScale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Animated gradient background
            GradientBackground()
            
            // Multiple animated ambient orbs
            ForEach(0..<3) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                [Color(red: 0.8, green: 0.2, blue: 0.3),
                                 Color(red: 0.4, green: 0.2, blue: 0.9),
                                 Color(red: 0.8, green: 0.3, blue: 0.9)][index].opacity(0.3),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: CGFloat(180 + index * 30)
                        )
                    )
                    .frame(width: CGFloat(300 + index * 50), height: CGFloat(300 + index * 50))
                    .blur(radius: CGFloat(60 + index * 10))
                    .offset(
                        x: CGFloat([-120, 100, -50][index]),
                        y: CGFloat([-200, 250, 100][index])
                    )
                    .rotationEffect(.degrees(rotationAngle * (index % 2 == 0 ? 1 : -1)))
            }
            
            // Main content
            VStack(spacing: 40) {
                Spacer()
                
                // Logo with animations
                ZStack {
                    // Outer glow ring
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.8, green: 0.2, blue: 0.3),
                                    Color(red: 0.95, green: 0.4, blue: 0.5)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 3
                        )
                        .frame(width: 140, height: 140)
                        .opacity(glowIntensity)
                        .scaleEffect(pulseScale)
                    
                    // Main logo circle
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
                        .frame(width: 120, height: 120)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.3), lineWidth: 2)
                        )
                        .shadow(
                            color: Color(red: 0.8, green: 0.2, blue: 0.3).opacity(glowIntensity * 0.8),
                            radius: 30,
                            y: 10
                        )
                    
                    // Icon
                    Image(systemName: "figure.strengthtraining.traditional")
                        .font(.system(size: 55, weight: .semibold))
                        .foregroundStyle(.white)
                        .rotationEffect(.degrees(rotationAngle * 0.1))
                }
                .scaleEffect(logoScale)
                .opacity(logoOpacity)
                
                // App name
                VStack(spacing: 8) {
                    Text("GymBuddy")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.white, Color.white.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .opacity(logoOpacity)
                    
                    Text("LOADING YOUR WORKOUT")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.white.opacity(0.5))
                        .tracking(2)
                        .opacity(logoOpacity)
                }
                
                // Animated loading indicator
                HStack(spacing: 8) {
                    ForEach(0..<3) { index in
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
                            .frame(width: 12, height: 12)
                            .scaleEffect(pulseScale)
                            .opacity(logoOpacity)
                            .animation(
                                .easeInOut(duration: 0.6)
                                .repeatForever()
                                .delay(Double(index) * 0.2),
                                value: pulseScale
                            )
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Version or tagline
                Text("Train Smarter, Not Harder")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white.opacity(0.4))
                    .opacity(logoOpacity)
                    .padding(.bottom, 50)
            }
        }
        .onAppear {
            // Logo entrance animation
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                logoScale = 1.0
                logoOpacity = 1.0
            }
            
            // Glow pulse animation
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                glowIntensity = 0.8
            }
            
            // Continuous rotation for orbs
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                rotationAngle = 360
            }
            
            // Pulse animation for loading dots
            withAnimation(.easeInOut(duration: 0.6).repeatForever()) {
                pulseScale = 1.3
            }
        }
    }
}

#Preview {
    LoadingScreen()
}

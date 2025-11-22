import SwiftUI

struct GradientBackground: View {
    var body: some View {
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
    }
}

#Preview {
    GradientBackground()
}

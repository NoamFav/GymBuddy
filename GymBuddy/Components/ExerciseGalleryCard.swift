import SwiftUI
struct ExerciseGalleryCard: View {
    let exercise: Exercise

    var body: some View {
        VStack(spacing: 10) {
            if let imageName = exercise.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
                    .shadow(radius: 8, y: 4)
            } else {
                // Fallback if some exercise has no image
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white.opacity(0.06))
                    .frame(height: 220)
                    .overlay(
                        Text("No Image")
                            .foregroundStyle(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                    )
            }

            Text(exercise.name)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(12)
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
                        .stroke(Color.white.opacity(0.18), lineWidth: 1)
                )
        )
        .padding(.vertical, 4)
    }
}

#Preview {
    ExerciseGalleryCard(exercise: .init(name: "Test", imageName: "deadlift"))
}

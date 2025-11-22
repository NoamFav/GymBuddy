import SwiftUI

struct QuizView: View {
    let category: QuizCategory
    @State private var questions: [QuizQuestion] = []
    @State private var currentIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var score = 0
    @State private var showingResult = false
    @Environment(\.dismiss) var dismiss
    
    var currentQuestion: QuizQuestion? {
        questions.indices.contains(currentIndex) ? questions[currentIndex] : nil
    }
    
    var isQuizComplete: Bool {
        currentIndex >= questions.count
    }
    
    var progress: Double {
        guard questions.count > 0 else { return 0 }
        return Double(currentIndex) / Double(questions.count)
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
            
            // Ambient orbs
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            category.gradient[0].opacity(0.3),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 10,
                        endRadius: 200
                        )
                )
                .frame(width: 350, height: 350)
                .blur(radius: 70)
                .offset(x: 130, y: -180)
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            category.gradient[1].opacity(0.25),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 10,
                        endRadius: 180
                    )
                )
                .frame(width: 300, height: 300)
                .blur(radius: 60)
                .offset(x: -120, y: 300)
            
            VStack(spacing: 0) {
                if isQuizComplete {
                    CompletionView(score: score, total: questions.count, category: category) {
                        dismiss()
                    }
                } else if let question = currentQuestion {
                    // Progress bar
                    VStack(spacing: 12) {
                        HStack {
                            Text("Question \(currentIndex + 1)/\(questions.count)")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.7))
                            
                            Spacer()
                            
                            Text("\(Int(progress * 100))%")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.white.opacity(0.9))
                        }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(Color.white.opacity(0.1))
                                
                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            colors: category.gradient,
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(width: geometry.size.width * progress)
                            }
                        }
                        .frame(height: 6)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 8)
                    .padding(.bottom, 24)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 24) {
                            // Question card with liquid glass
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    Image(systemName: category.icon)
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(
                                            LinearGradient(
                                                colors: category.gradient,
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                    
                                    Text(category.rawValue.uppercased())
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundStyle(.white.opacity(0.5))
                                        .tracking(1.5)
                                    
                                    Spacer()
                                }
                                
                                Text(question.question)
                                    .font(.system(size: 26, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineSpacing(4)
                                
                                // NEW: Display image if available
                                if let imageName = question.imageName {
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxHeight: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                        )
                                        .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
                                }
                            }
                            .padding(28)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 28)
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
                                            RoundedRectangle(cornerRadius: 28)
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
                                            RoundedRectangle(cornerRadius: 28)
                                                .fill(.ultraThinMaterial)
                                        )
                                        .shadow(color: .black.opacity(0.4), radius: 25, y: 12)
                                }
                            )
                            
                            // Answer options
                            VStack(spacing: 12) {
                                ForEach(question.answers.indices, id: \.self) { index in
                                    AnswerButton(
                                        text: question.answers[index],
                                        isSelected: selectedAnswer == index,
                                        isCorrect: showingResult ? index == question.correctIndex : nil,
                                        gradient: category.gradient
                                    ) {
                                        selectAnswer(index)
                                    }
                                }
                            }
                            
                            // Explanation card
                            if showingResult, let explanation = question.explanation {
                                VStack(alignment: .leading, spacing: 16) {
                                    HStack(spacing: 10) {
                                        Image(systemName: selectedAnswer == question.correctIndex ? "checkmark.circle.fill" : "lightbulb.fill")
                                            .font(.system(size: 24, weight: .semibold))
                                            .foregroundStyle(selectedAnswer == question.correctIndex ? Color.green : Color.orange)
                                        
                                        Text(selectedAnswer == question.correctIndex ? "Excellent!" : "Learn & Grow")
                                            .font(.system(size: 22, weight: .bold, design: .rounded))
                                            .foregroundStyle(.white)
                                    }
                                    
                                    Text(explanation)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.white.opacity(0.85))
                                        .fixedSize(horizontal: false, vertical: true)
                                        .lineSpacing(3)
                                }
                                .padding(24)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 24)
                                            .fill(
                                                (selectedAnswer == question.correctIndex ?
                                                 Color.green : Color.orange)
                                                .opacity(0.15)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 24)
                                                    .stroke(
                                                        (selectedAnswer == question.correctIndex ?
                                                         Color.green : Color.orange)
                                                        .opacity(0.4),
                                                        lineWidth: 1
                                                    )
                                            )
                                            .background(
                                                RoundedRectangle(cornerRadius: 24)
                                                    .fill(.ultraThinMaterial)
                                            )
                                            .shadow(
                                                color: (selectedAnswer == question.correctIndex ?
                                                        Color.green : Color.orange)
                                                .opacity(0.3),
                                                radius: 20,
                                                y: 10
                                            )
                                    }
                                )
                            }
                            
                            // Next button
                            if showingResult {
                                Button(action: nextQuestion) {
                                    HStack(spacing: 12) {
                                        Text(currentIndex == questions.count - 1 ? "View Results" : "Next Question")
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                        
                                        Image(systemName: currentIndex == questions.count - 1 ? "checkmark.circle.fill" : "arrow.right.circle.fill")
                                            .font(.system(size: 20, weight: .semibold))
                                    }
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 18)
                                    .background(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(
                                                    LinearGradient(
                                                        colors: category.gradient,
                                                        startPoint: .leading,
                                                        endPoint: .trailing
                                                    )
                                                )
                                                .shadow(color: category.gradient[0].opacity(0.5), radius: 20, y: 10)
                                            
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                        }
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 30)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 8) {
                    Image(systemName: category.icon)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Text(category.rawValue)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
        }
        .onAppear {
            questions = QuizData.questions(for: category, count: 10)
            currentIndex = 0
            selectedAnswer = nil
            score = 0
            showingResult = false
        }
    }
    
    private func selectAnswer(_ index: Int) {
        guard selectedAnswer == nil else { return }
        
        selectedAnswer = index
        showingResult = true
        
        if index == currentQuestion?.correctIndex {
            score += 1
        }
    }
    
    private func nextQuestion() {
        guard currentIndex < questions.count - 1 else {
            // last question → mark quiz complete
            currentIndex = questions.count
            showingResult = false
            return
        }
        currentIndex += 1
        selectedAnswer = nil
        showingResult = false
    }
}

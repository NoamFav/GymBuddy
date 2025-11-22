import SwiftUI

struct AdvancedQuizView: View {
    let category: AdvancedQuizCategory
    @State private var questions: [AdvancedQuizQuestion] = []
    @State private var currentIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var score = 0
    @State private var showingResult = false
    @Environment(\.dismiss) var dismiss
    
    var currentQuestion: AdvancedQuizQuestion? {
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
                    AdvancedCompletionView(score: score, total: questions.count, category: category) {
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
                            // Question card with exercise image
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
                                
                                // Exercise Image - LARGE and prominent
                                if !question.imageName.isEmpty {
                                    Image(question.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxHeight: 280)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(
                                                    LinearGradient(
                                                        colors: [
                                                            Color.white.opacity(0.3),
                                                            Color.white.opacity(0.1)
                                                        ],
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    ),
                                                    lineWidth: 2
                                                )
                                        )
                                        .shadow(color: category.gradient[0].opacity(0.4), radius: 20, y: 10)
                                }
                                
                                // Question text
                                Text(question.question)
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineSpacing(4)
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
                            if showingResult {
                                VStack(alignment: .leading, spacing: 16) {
                                    HStack(spacing: 10) {
                                        Image(systemName: selectedAnswer == question.correctIndex ? "checkmark.circle.fill" : "lightbulb.fill")
                                            .font(.system(size: 24, weight: .semibold))
                                            .foregroundStyle(selectedAnswer == question.correctIndex ? Color.green : Color.orange)
                                        
                                        Text(selectedAnswer == question.correctIndex ? "Excellent!" : "Learn & Grow")
                                            .font(.system(size: 22, weight: .bold, design: .rounded))
                                            .foregroundStyle(.white)
                                    }
                                    
                                    Text(question.explanation)
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
            questions = AdvancedQuizData.questions(for: category, count: 15)
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
            currentIndex = questions.count
            showingResult = false
            return
        }
        currentIndex += 1
        selectedAnswer = nil
        showingResult = false
    }
}

// MARK: - Advanced Completion View
struct AdvancedCompletionView: View {
    let score: Int
    let total: Int
    let category: AdvancedQuizCategory
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
    }
}

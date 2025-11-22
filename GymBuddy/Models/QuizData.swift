import SwiftUI
import Foundation
import Combine

// MARK: - Quiz Manager
class QuizManager: ObservableObject {
    @Published var allQuestions: [QuizQuestion] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    static let shared = QuizManager()
    
    private init() {
        loadQuestions()
    }
    
    private func loadQuestions() {
        guard let url = Bundle.main.url(forResource: "quiz_data", withExtension: "json") else {
            errorMessage = "Could not find quiz_data.json in bundle"
            isLoading = false
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let quizData = try decoder.decode(QuizDataContainer.self, from: data)
            
            // Convert JSON questions to QuizQuestion objects
            self.allQuestions = quizData.questions.compactMap { jsonQuestion in
                guard let category = QuizCategory(rawValue: jsonQuestion.category) else {
                    return nil
                }
                
                return QuizQuestion(
                    category: category,
                    question: jsonQuestion.question,
                    answers: jsonQuestion.answers,
                    correctIndex: jsonQuestion.correctIndex,
                    explanation: jsonQuestion.explanation,
                    imageName: jsonQuestion.imageName
                )
            }
            
            self.isLoading = false
        } catch {
            errorMessage = "Error loading quiz data: \(error.localizedDescription)"
            isLoading = false
        }
    }
    
    func questions(for category: QuizCategory, count: Int = 10) -> [QuizQuestion] {
        let categoryQuestions = allQuestions.filter { $0.category == category }
        return Array(categoryQuestions.shuffled().prefix(count))
    }
}

// MARK: - JSON Decodable Structures
struct QuizDataContainer: Codable {
    let categories: [String]
    let questions: [QuizQuestionJSON]
}

struct QuizQuestionJSON: Codable {
    let category: String
    let question: String
    let answers: [String]
    let correctIndex: Int
    let explanation: String
    let imageName: String?
}

// MARK: - Legacy Static Access (for backward compatibility)
enum QuizData {
    static var allQuestions: [QuizQuestion] {
        QuizManager.shared.allQuestions
    }
    
    static func questions(for category: QuizCategory, count: Int = 10) -> [QuizQuestion] {
        QuizManager.shared.questions(for: category, count: count)
    }
}

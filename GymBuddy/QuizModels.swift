import SwiftUI

enum QuizCategory: String, CaseIterable, Identifiable {
    case machines = "Machines"
    case trivia = "Trivia"
    case funFacts = "Fun Facts"
    case science = "Science"
    case nutrition = "Nutrition"
    case technique = "Technique"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .machines: return "figure.strengthtraining.traditional"
        case .trivia: return "trophy.fill"
        case .funFacts: return "sparkles"
        case .science: return "flask.fill"
        case .nutrition: return "fork.knife"
        case .technique: return "target"
        }
    }
    
    var gradient: [Color] {
        switch self {
        case .machines: return [Color(red: 0.8, green: 0.2, blue: 0.3), Color(red: 0.95, green: 0.4, blue: 0.5)]
        case .trivia: return [Color(red: 0.9, green: 0.6, blue: 0.1), Color(red: 0.95, green: 0.75, blue: 0.3)]
        case .funFacts: return [Color(red: 0.3, green: 0.6, blue: 0.9), Color(red: 0.5, green: 0.75, blue: 0.95)]
        case .science: return [Color(red: 0.5, green: 0.3, blue: 0.8), Color(red: 0.65, green: 0.45, blue: 0.9)]
        case .nutrition: return [Color(red: 0.2, green: 0.7, blue: 0.4), Color(red: 0.4, green: 0.85, blue: 0.6)]
        case .technique: return [Color(red: 0.2, green: 0.5, blue: 0.8), Color(red: 0.4, green: 0.65, blue: 0.9)]
        }
    }
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let category: QuizCategory
    let question: String
    let answers: [String]
    let correctIndex: Int
    let explanation: String?
    let imageName: String?  // NEW: Optional image asset name
    
    // Convenience initializer for questions without images
    init(category: QuizCategory, question: String, answers: [String], correctIndex: Int, explanation: String? = nil) {
        self.category = category
        self.question = question
        self.answers = answers
        self.correctIndex = correctIndex
        self.explanation = explanation
        self.imageName = nil
    }
    
    // Full initializer with image support
    init(category: QuizCategory, question: String, answers: [String], correctIndex: Int, explanation: String?, imageName: String?) {
        self.category = category
        self.question = question
        self.answers = answers
        self.correctIndex = correctIndex
        self.explanation = explanation
        self.imageName = imageName
    }
}

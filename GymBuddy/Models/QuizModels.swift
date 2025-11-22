import SwiftUI

enum QuizCategory: String, CaseIterable, Identifiable {
    case machines = "machines"
    case trivia = "trivia"
    case funFacts = "funFacts"
    case science = "science"
    case nutrition = "nutrition"
    case technique = "technique"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .machines: return "Machines"
        case .trivia: return "Trivia"
        case .funFacts: return "Fun Facts"
        case .science: return "Science"
        case .nutrition: return "Nutrition"
        case .technique: return "Technique"
        }
    }
    
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

enum AdvancedQuizCategory: String, CaseIterable, Identifiable {
    case strength = "Strength & Power"
    case hypertrophy = "Hypertrophy"
    case endurance = "Muscular Endurance"
    case mobility = "Mobility & Stability"
    case compound = "Big Compound Lifts"
    case isolation = "Isolation Work"
    case conditioning = "Conditioning / Metabolic"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .strength: return "bolt.fill"
        case .hypertrophy: return "dumbbell.fill"
        case .endurance: return "figure.run"
        case .mobility: return "figure.cooldown"
        case .compound: return "square.stack.3d.up.fill"
        case .isolation: return "target"
        case .conditioning: return "flame.fill"
        }
    }

    var gradient: [Color] {
        switch self {
        case .strength: return [Color(red: 0.9, green: 0.4, blue: 0.2), Color(red: 1.0, green: 0.6, blue: 0.3)]
        case .hypertrophy: return [Color(red: 0.8, green: 0.2, blue: 0.6), Color(red: 0.95, green: 0.4, blue: 0.8)]
        case .endurance: return [Color(red: 0.2, green: 0.6, blue: 0.9), Color(red: 0.4, green: 0.75, blue: 0.95)]
        case .mobility: return [Color(red: 0.2, green: 0.8, blue: 0.6), Color(red: 0.4, green: 0.9, blue: 0.7)]
        case .compound: return [Color(red: 0.6, green: 0.4, blue: 0.9), Color(red: 0.75, green: 0.55, blue: 0.95)]
        case .isolation: return [Color(red: 0.9, green: 0.7, blue: 0.2), Color(red: 0.95, green: 0.8, blue: 0.4)]
        case .conditioning: return [Color(red: 0.9, green: 0.3, blue: 0.3), Color(red: 1.0, green: 0.5, blue: 0.4)]
        }
    }
}



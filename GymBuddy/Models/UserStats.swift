import SwiftUI

// MARK: - User Statistics Model
struct UserStats {
    var totalQuizzes: Int = 0
    var correctAnswers: Int = 0
    var totalQuestions: Int = 0
    var currentStreak: Int = 0
    var bestStreak: Int = 0
    var totalPoints: Int = 0
    var level: Int = 1
    var todayChallengeCompleted: Bool = false
    var lastQuizDate: Date?
    
    var accuracy: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctAnswers) / Double(totalQuestions) * 100
    }
    
    var nextLevelPoints: Int {
        return level * 500
    }
    
    var progressToNextLevel: Double {
        let pointsInLevel = totalPoints % 500
        return Double(pointsInLevel) / Double(nextLevelPoints)
    }
    
    // Mock data for preview
    static var mock: UserStats {
        UserStats(
            totalQuizzes: 47,
            correctAnswers: 312,
            totalQuestions: 470,
            currentStreak: 7,
            bestStreak: 12,
            totalPoints: 3840,
            level: 8,
            todayChallengeCompleted: false,
            lastQuizDate: Date()
        )
    }
}

// MARK: - Recent Quiz Result
struct RecentQuizResult: Identifiable {
    let id = UUID()
    let category: String
    let score: Int
    let total: Int
    let date: String
    let gradient: [Color]
}

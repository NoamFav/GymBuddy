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

// MARK: - Dashboard View
struct DashboardView: View {
    @State private var userStats = UserStats.mock // Replace with actual data source
    @State private var showingDailyChallenge = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
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
                                Color(red: 0.4, green: 0.2, blue: 0.9).opacity(0.3),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 200
                        )
                    )
                    .frame(width: 400, height: 400)
                    .blur(radius: 80)
                    .offset(x: -150, y: -250)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.8, green: 0.3, blue: 0.9).opacity(0.25),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 180
                        )
                    )
                    .frame(width: 350, height: 350)
                    .blur(radius: 70)
                    .offset(x: 180, y: 350)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // Header
                        headerSection
                        
                        // Daily Challenge Card
                        dailyChallengeCard
                        
                        // Stats Grid
                        statsGrid
                        
                        // Level Progress
                        levelProgressCard
                        
                        // Recent Activity
                        recentActivitySection
                        
                        // Quick Actions
                        quickActionsSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Welcome back!")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.white.opacity(0.7))
                    
                    Text("Keep building your knowledge")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                // Level badge
                VStack(spacing: 4) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.9, green: 0.6, blue: 0.1),
                                        Color(red: 0.95, green: 0.75, blue: 0.3)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 60, height: 60)
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.3), lineWidth: 2)
                            )
                            .shadow(color: Color(red: 0.9, green: 0.6, blue: 0.1).opacity(0.5), radius: 15, y: 5)
                        
                        Text("\(userStats.level)")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                    }
                    
                    Text("Level")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
        }
    }
    
    // MARK: - Daily Challenge Card
    private var dailyChallengeCard: some View {
        Button(action: { showingDailyChallenge = true }) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.orange, Color.red],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 56, height: 56)
                    
                    Image(systemName: userStats.todayChallengeCompleted ? "checkmark.circle.fill" : "flame.fill")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.white)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Daily Challenge")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text(userStats.todayChallengeCompleted ? "Completed! Come back tomorrow" : "Test your knowledge today")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.white.opacity(0.7))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            LinearGradient(
                                colors: userStats.todayChallengeCompleted ?
                                    [Color.green.opacity(0.2), Color.green.opacity(0.1)] :
                                    [Color.orange.opacity(0.2), Color.red.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
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
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.ultraThinMaterial)
                        )
                        .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
                }
            )
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Stats Grid
    private var statsGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            StatCard(
                icon: "target",
                title: "Accuracy",
                value: String(format: "%.0f%%", userStats.accuracy),
                gradient: [Color.blue, Color.cyan]
            )
            
            StatCard(
                icon: "flame.fill",
                title: "Streak",
                value: "\(userStats.currentStreak) days",
                gradient: [Color.orange, Color.red]
            )
            
            StatCard(
                icon: "chart.line.uptrend.xyaxis",
                title: "Quizzes",
                value: "\(userStats.totalQuizzes)",
                gradient: [Color.purple, Color.pink]
            )
            
            StatCard(
                icon: "star.fill",
                title: "Best Streak",
                value: "\(userStats.bestStreak) days",
                gradient: [Color.yellow, Color.orange]
            )
        }
    }
    
    // MARK: - Level Progress Card
    private var levelProgressCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(red: 0.9, green: 0.6, blue: 0.1), Color(red: 0.95, green: 0.75, blue: 0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                Text("Level Progress")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("Level \(userStats.level)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.6))
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("\(userStats.totalPoints) pts")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.white.opacity(0.8))
                    
                    Spacer()
                    
                    Text("\(userStats.nextLevelPoints) pts")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.white.opacity(0.8))
                }
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.white.opacity(0.1))
                        
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [Color(red: 0.9, green: 0.6, blue: 0.1), Color(red: 0.95, green: 0.75, blue: 0.3)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geometry.size.width * userStats.progressToNextLevel)
                    }
                }
                .frame(height: 12)
                
                Text("\(Int((1 - userStats.progressToNextLevel) * Double(userStats.nextLevelPoints))) points to level \(userStats.level + 1)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.6))
            }
        }
        .padding(24)
        .glassCard(cornerRadius: 24)
    }
    
    // MARK: - Recent Activity Section
    private var recentActivitySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.purple, Color.pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                Text("Recent Activity")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            
            VStack(spacing: 12) {
                RecentQuizRow(
                    category: "Nutrition",
                    score: 9,
                    total: 10,
                    date: "2 days ago",
                    gradient: [Color(red: 0.2, green: 0.7, blue: 0.4), Color(red: 0.4, green: 0.85, blue: 0.6)]
                )
                
                RecentQuizRow(
                    category: "Science",
                    score: 7,
                    total: 10,
                    date: "3 days ago",
                    gradient: [Color(red: 0.5, green: 0.3, blue: 0.8), Color(red: 0.65, green: 0.45, blue: 0.9)]
                )
                
                RecentQuizRow(
                    category: "Fun Facts",
                    score: 10,
                    total: 10,
                    date: "4 days ago",
                    gradient: [Color(red: 0.3, green: 0.6, blue: 0.9), Color(red: 0.5, green: 0.75, blue: 0.95)]
                )
            }
        }
        .padding(24)
        .glassCard(cornerRadius: 24)
    }
    
    // MARK: - Quick Actions Section
    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Quick Actions")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            
            VStack(spacing: 12) {
                QuickActionButton(
                    icon: "square.grid.2x2.fill",
                    title: "Browse Categories",
                    subtitle: "6 quiz categories",
                    gradient: [Color.red, Color.pink]
                )
                
                QuickActionButton(
                    icon: "line.3.horizontal.decrease.circle.fill",
                    title: "Training Focus",
                    subtitle: "Image-based challenges",
                    gradient: [Color.purple, Color.indigo]
                )
                
                QuickActionButton(
                    icon: "photo.on.rectangle.fill",
                    title: "Exercise Gallery",
                    subtitle: "160+ exercises",
                    gradient: [Color.blue, Color.cyan]
                )
            }
        }
    }
}

// MARK: - Stat Card Component
struct StatCard: View {
    let icon: String
    let title: String
    let value: String
    let gradient: [Color]
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 50, height: 50)
                    .shadow(color: gradient[0].opacity(0.4), radius: 10, y: 5)
                
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(.white)
            }
            
            Text(value)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .glassCard(cornerRadius: 20)
    }
}

// MARK: - Recent Quiz Row Component
struct RecentQuizRow: View {
    let category: String
    let score: Int
    let total: Int
    let date: String
    let gradient: [Color]
    
    var accuracy: Double {
        Double(score) / Double(total) * 100
    }
    
    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 12, height: 12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(category)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text(date)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.5))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(score)/\(total)")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Text(String(format: "%.0f%%", accuracy))
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(accuracy >= 80 ? Color.green : (accuracy >= 60 ? Color.orange : Color.red))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
}

// MARK: - Quick Action Button Component
struct QuickActionButton: View {
    let icon: String
    let title: String
    let subtitle: String
    let gradient: [Color]
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(
                            LinearGradient(
                                colors: gradient,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                        .shadow(color: gradient[0].opacity(0.4), radius: 10, y: 5)
                    
                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(.white)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.4))
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

// MARK: - Preview
#Preview {
    DashboardView()
}

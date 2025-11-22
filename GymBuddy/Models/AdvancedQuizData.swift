import Foundation

// MARK: - Advanced Quiz Question Model
struct AdvancedQuizQuestion: Identifiable {
    let id = UUID()
    let imageName: String
    let exerciseName: String
    let category: AdvancedQuizCategory
    let questionType: QuestionType
    let question: String
    let answers: [String]
    let correctIndex: Int
    let explanation: String
    
    enum QuestionType {
        case muscleTarget
        case exerciseName
        case movementType
    }
}

// MARK: - Advanced Quiz Data Generator
enum AdvancedQuizData {
    
    // Generate questions for a specific exercise
    static func questionsForExercise(_ exercise: Exercise, category advancedCategory: AdvancedQuizCategory) -> [AdvancedQuizQuestion] {
        var questions: [AdvancedQuizQuestion] = []
        
        // Question 1: Which muscle group does this target?
        questions.append(createMuscleTargetQuestion(for: exercise, category: advancedCategory))
        
        // Question 2: What is the name of this exercise?
        questions.append(createNameQuestion(for: exercise, category: advancedCategory))
        
        // Question 3: What type of movement is this?
        questions.append(createMovementTypeQuestion(for: exercise, category: advancedCategory))
        
        return questions
    }
    
    // Get all questions for a category
    static func questions(for category: AdvancedQuizCategory, count: Int = 15) -> [AdvancedQuizQuestion] {
        let categoryExercises = exercisesForCategory(category)
        var allQuestions: [AdvancedQuizQuestion] = []
        
        for exercise in categoryExercises {
            allQuestions.append(contentsOf: questionsForExercise(exercise, category: category))
        }
        
        return Array(allQuestions.shuffled().prefix(count))
    }
    
    // MARK: - Question Creators
    
    private static func createMuscleTargetQuestion(for exercise: Exercise, category advancedCategory: AdvancedQuizCategory) -> AdvancedQuizQuestion {
        let exerciseCategory = category(for: exercise)
        let correctAnswer = exerciseCategory.title
        
        // Generate wrong answers from other categories
        let wrongAnswers = ExerciseCategory.allCases
            .filter { $0 != exerciseCategory }
            .map { $0.title }
            .shuffled()
            .prefix(3)
        
        var allAnswers = Array(wrongAnswers) + [correctAnswer]
        allAnswers.shuffle()
        
        let correctIndex = allAnswers.firstIndex(of: correctAnswer) ?? 0
        
        return AdvancedQuizQuestion(
            imageName: exercise.imageName ?? "",
            exerciseName: exercise.name,
            category: advancedCategory,
            questionType: .muscleTarget,
            question: "Which muscle group does this exercise primarily target?",
            answers: allAnswers,
            correctIndex: correctIndex,
            explanation: "The \(exercise.name) primarily targets the \(correctAnswer.lowercased()) muscles."
        )
    }
    
    private static func createNameQuestion(for exercise: Exercise, category advancedCategory: AdvancedQuizCategory) -> AdvancedQuizQuestion {
        let correctAnswer = exercise.name
        
        // Get similar exercises for wrong answers
        let categoryExercises = exercisesForCategory(advancedCategory)
        let wrongAnswers = categoryExercises
            .filter { $0.name != exercise.name }
            .map { $0.name }
            .shuffled()
            .prefix(3)
        
        var allAnswers = Array(wrongAnswers) + [correctAnswer]
        allAnswers.shuffle()
        
        let correctIndex = allAnswers.firstIndex(of: correctAnswer) ?? 0
        
        return AdvancedQuizQuestion(
            imageName: exercise.imageName ?? "",
            exerciseName: exercise.name,
            category: advancedCategory,
            questionType: .exerciseName,
            question: "What is the name of this exercise?",
            answers: allAnswers,
            correctIndex: correctIndex,
            explanation: "This is the \(correctAnswer), a great exercise for building strength and muscle."
        )
    }
    
    private static func createMovementTypeQuestion(for exercise: Exercise, category advancedCategory: AdvancedQuizCategory) -> AdvancedQuizQuestion {
        let movementType = classifyMovement(exercise)
        let correctAnswer = movementType.rawValue
        
        var allAnswers = MovementType.allCases.map { $0.rawValue }
        allAnswers.shuffle()
        
        let correctIndex = allAnswers.firstIndex(of: correctAnswer) ?? 0
        
        return AdvancedQuizQuestion(
            imageName: exercise.imageName ?? "",
            exerciseName: exercise.name,
            category: advancedCategory,
            questionType: .movementType,
            question: "What type of movement pattern is this?",
            answers: allAnswers,
            correctIndex: correctIndex,
            explanation: movementType.explanation(for: exercise.name)
        )
    }
    
    // MARK: - Movement Classification
    
    enum MovementType: String, CaseIterable {
        case compound = "Compound (Multi-joint)"
        case isolation = "Isolation (Single-joint)"
        case power = "Power / Explosive"
        case stability = "Stability / Core"
        
        func explanation(for exerciseName: String) -> String {
            switch self {
            case .compound:
                return "The \(exerciseName) is a compound movement that works multiple muscle groups and joints simultaneously, making it excellent for overall strength development."
            case .isolation:
                return "The \(exerciseName) is an isolation exercise that focuses on a single muscle group, perfect for targeting specific areas and building muscle definition."
            case .power:
                return "The \(exerciseName) is a power movement that develops explosive strength and athletic performance through rapid force generation."
            case .stability:
                return "The \(exerciseName) emphasizes core stability and balance, essential for functional fitness and injury prevention."
            }
        }
    }
    
    private static func classifyMovement(_ exercise: Exercise) -> MovementType {
        let name = exercise.name.lowercased()
        
        // Power/Explosive movements - check first as these are specific
        if name.contains("jump") || name.contains("explosive") || name.contains("power") ||
            name.contains("clean") || name.contains("snatch") || name.contains("jerk") {
            return .power
        }
        
        // Stability/Core movements
        if name.contains("plank") || name.contains("crunch") || name.contains("twist") ||
            name.contains("stability") || name.contains("balance") || name.contains("rollout") ||
            name.contains("ab wheel") || name.contains("knee raise") || name.contains("leg raise") ||
            name.contains("windshield") || name.contains("oblique") || name.contains("scissor") ||
            name.contains("bicycle") && name.contains("crunch") ||
            name.contains("sit-up") || name.contains("sit up") ||
            name.contains("torso") || name.contains("hanging") ||
            name.contains("abdominal") {
            return .stability
        }
        
        // Compound movements - multi-joint exercises
        if (name.contains("squat") && !name.contains("front")) ||
            name.contains("deadlift") ||
            (name.contains("press") && (name.contains("bench") || name.contains("shoulder") || name.contains("overhead") || name.contains("chest"))) ||
            name.contains("pull-up") || name.contains("pull up") ||
            (name.contains("row") && !name.contains("wrist")) ||
            name.contains("lunge") ||
            (name.contains("dip") && !name.contains("tricep")) ||
            name.contains("pull over") || name.contains("pullover") ||
            name.contains("step up") || name.contains("step-up") ||
            name.contains("good morning") ||
            name.contains("front squat") ||
            name.contains("hack squat") ||
            name.contains("zercher") ||
            name.contains("t-bar") ||
            name.contains("inverted row") ||
            (name.contains("push-up") && !name.contains("tricep")) {
            return .compound
        }
        
        // Isolation movements - single joint exercises
        if name.contains("curl") && !name.contains("leg curl") && !name.contains("good") ||
            name.contains("extension") && (name.contains("tricep") || name.contains("leg") || name.contains("wrist")) ||
            name.contains("fly") || name.contains("flys") ||
            (name.contains("raise") && (name.contains("lateral") || name.contains("front") || name.contains("calf"))) ||
            name.contains("shrug") ||
            name.contains("kickback") ||
            name.contains("skullcrusher") || name.contains("skull crusher") ||
            name.contains("reverse butterfly") ||
            name.contains("pec deck") ||
            name.contains("finger curl") ||
            name.contains("wrist curl") ||
            name.contains("concentration") ||
            name.contains("preacher") ||
            name.contains("pulldown") && name.contains("straight arm") ||
            name.contains("leg extension") ||
            name.contains("leg curl") ||
            name.contains("calf raise") {
            return .isolation
        }
        
        // Default to compound for safety (better to overestimate complexity)
        return .compound
    }
    
    // MARK: - Category Exercise Mapping
    
    private static func exercisesForCategory(_ category: AdvancedQuizCategory) -> [Exercise] {
        switch category {
        case .strength:
            // Heavy compound lifts for max strength - the big powerlifting and Olympic movements
            return ExerciseData.all.filter { exercise in
                let name = exercise.name.lowercased()
                return (name.contains("squat") && !name.contains("dumbbell") && !name.contains("cable")) ||
                       (name.contains("deadlift") && !name.contains("cable") && !name.contains("dumbbell romanian")) ||
                       name.contains("bench press") && !name.contains("decline") && !name.contains("incline") ||
                       name.contains("overhead press") ||
                       name == "front squats" ||
                       name == "sumo deadlift" ||
                       name == "zercher squat" ||
                       name == "hack squat"
            }
            
        case .hypertrophy:
            // Exercises focused on muscle building - mix of compound and isolation for maximum muscle growth
            return ExerciseData.all.filter { exercise in
                let name = exercise.name.lowercased()
                return name.contains("dumbbell") && !name.contains("squat") ||
                       name.contains("fly") ||
                       name.contains("curl") && !name.contains("leg curl") ||
                       name.contains("lateral raise") ||
                       name.contains("front raise") ||
                       name.contains("pulldown") ||
                       name.contains("incline") && (name.contains("press") || name.contains("fly")) ||
                       name.contains("decline") && (name.contains("press") || name.contains("fly")) ||
                       name.contains("preacher") ||
                       name.contains("concentration") ||
                       name.contains("arnold press")
            }
            
        case .endurance:
            // Higher rep, bodyweight, and machine exercises for muscular endurance
            return ExerciseData.all.filter { exercise in
                let name = exercise.name.lowercased()
                return name.contains("push-up") ||
                       name.contains("sit-up") ||
                       name.contains("crunch") ||
                       name.contains("machine") && !name.contains("torso") ||
                       name.contains("leg press") ||
                       name.contains("leg extension") ||
                       name.contains("leg curl") ||
                       name.contains("calf raise") ||
                       name.contains("step up") ||
                       name.contains("mountain climber") ||
                       name.contains("bicycle")
            }
            
        case .mobility:
            // Exercises emphasizing flexibility, stability, and range of motion
            return ExerciseData.all.filter { exercise in
                let name = exercise.name.lowercased()
                return name.contains("good morning") ||
                       name.contains("romanian deadlift") ||
                       name.contains("twist") ||
                       name.contains("rotation") ||
                       name.contains("windshield") ||
                       name.contains("back extension") ||
                       name.contains("hyperextension") ||
                       name.contains("stability ball") ||
                       name.contains("ab wheel") ||
                       name.contains("side bend") ||
                       name.contains("oblique")
            }
            
        case .compound:
            // Big multi-joint movements that work multiple muscle groups
            return ExerciseData.all.filter { exercise in
                let name = exercise.name.lowercased()
                return (name.contains("squat") || name.contains("deadlift") ||
                        name.contains("bench press") ||
                        name.contains("row") && !name.contains("cable") && !name.contains("machine") ||
                        name.contains("pull-up") ||
                        name.contains("dip") && !name.contains("tricep") ||
                        name.contains("lunge") ||
                        name.contains("pull over")) &&
                       !name.contains("cable curl") &&
                       !name.contains("wrist")
            }
            
        case .isolation:
            // Single joint movements targeting specific muscles
            return ExerciseData.all.filter { exercise in
                let name = exercise.name.lowercased()
                return name.contains("curl") && !name.contains("leg curl") ||
                       name.contains("extension") && (name.contains("tricep") || name.contains("leg") || name.contains("wrist")) ||
                       name.contains("fly") ||
                       name.contains("raise") && !name.contains("calf") ||
                       name.contains("shrug") ||
                       name.contains("kickback") ||
                       name.contains("skullcrusher") ||
                       name.contains("reverse butterfly") ||
                       name.contains("finger curl")
            }
            
        case .conditioning:
            // Metabolic conditioning and circuit-style work
            return ExerciseData.all.filter { exercise in
                let name = exercise.name.lowercased()
                return name.contains("resistance band") ||
                       name.contains("banded") ||
                       name.contains("mountain climber") ||
                       name.contains("cable") && (name.contains("crunch") || name.contains("deadlift") || name.contains("hip")) ||
                       name.contains("burpee") ||
                       name.contains("scissor kick") ||
                       name.contains("knee raise") ||
                       name.contains("hanging") ||
                       name.contains("inverted row")
            }
        }
    }
}

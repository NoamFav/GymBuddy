import Foundation

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    let name: String        // Pretty display name
    let imageName: String?   // Asset name (without .imageset)
}

enum ExerciseData {
    static let all: [Exercise] = [
        Exercise(name: "Ab Wheel Rollout", imageName: "ab-wheel-rollout"),
        Exercise(name: "Abdominal Crunch", imageName: "abdominal-crunch"),
        Exercise(name: "Abdominal Twist", imageName: "abdominal-twist"),
        Exercise(name: "Arnold Press", imageName: "arnold-press"),
        Exercise(name: "Assisted Pull Ups", imageName: "assisted-pull-ups"),
        Exercise(name: "Back Extension", imageName: "back-extension"),
        Exercise(name: "Band Calf Raise", imageName: "band-calf-raise"),
        Exercise(name: "Band Reverse Fly", imageName: "band-reverse-fly"),
        Exercise(name: "Band Wrist Extension", imageName: "band-wrist-extension"),
        Exercise(name: "Banded Good Mornings", imageName: "banded-good-mornings"),
        Exercise(name: "Banded Mountain Climbers", imageName: "banded-mountain-climbers"),
        Exercise(name: "Barbell Curls", imageName: "barbell-curls"),
        Exercise(name: "Barbell Front Raise", imageName: "barbell-front-raise"),
        Exercise(name: "Barbell Lunges", imageName: "barbell-lunges"),
        Exercise(name: "Barbell Reverse Wrist Curls", imageName: "barbell-reverse-wrist-curls"),
        Exercise(name: "Barbell Row", imageName: "barbell-row"),
        Exercise(name: "Barbell Shrugs", imageName: "barbell-shrugs"),
        Exercise(name: "Barbell Skull Crusher", imageName: "barbell-skull-crusher"),
        Exercise(name: "Barbell Squats", imageName: "barbell-squats"),
        Exercise(name: "Barbell Step Ups", imageName: "barbell-step-ups"),
        Exercise(name: "Barbell Wrist Curl", imageName: "barbell-wrist-curl"),
        Exercise(name: "Behind the Neck Overhead Press", imageName: "behind-the-neck-overhead-press"),
        Exercise(name: "Bench Dip", imageName: "bench-dip"),
        Exercise(name: "Bench Press", imageName: "bench-press"),
        Exercise(name: "Biceps Curls", imageName: "biceps-curls"),
        Exercise(name: "Bicycle Crunches", imageName: "bicycle-crunches"),
        Exercise(name: "Cable Chest Fly", imageName: "cable-chest-fly"),
        Exercise(name: "Cable Crunch", imageName: "cable-crunch"),
        Exercise(name: "Cable Curls", imageName: "cable-curls"),
        Exercise(name: "Cable Deadlift", imageName: "cable-deadlift"),
        Exercise(name: "Cable Hip Adduction", imageName: "cable-hip-adduction"),
        Exercise(name: "Cable Lat Pulldown Close Grip", imageName: "cable-lat-pulldown-close-grip"),
        Exercise(name: "Cable Lat Pulldown", imageName: "cable-lat-pulldown"),
        Exercise(name: "Cable Lying Knee Tucks", imageName: "cable-lying-knee-tucks"),
        Exercise(name: "Cable Row", imageName: "cable-row"),
        Exercise(name: "Cable Shrugs", imageName: "cable-shrugs"),
        Exercise(name: "Cable Tricep Pushdowns", imageName: "cable-tricep-pushdowns"),
        Exercise(name: "Cable Wrist Curls", imageName: "cable-wrist-curls"),
        Exercise(name: "Calf Raises", imageName: "calf-raises"),
        Exercise(name: "Chest Press", imageName: "chest-press"),
        Exercise(name: "Close Grip Bench Press", imageName: "close-grip-bench-press"),
        Exercise(name: "Concentration Curls", imageName: "concentration-curls"),
        Exercise(name: "Crunches", imageName: "crunches"),
        Exercise(name: "Deadlift", imageName: "deadlift"),
        Exercise(name: "Decline Bench Press", imageName: "decline-bench-press"),
        Exercise(name: "Decline Dumbbell Bench Press", imageName: "decline-dumbbell-bench-press"),
        Exercise(name: "Decline Flys", imageName: "decline-flys"),
        Exercise(name: "Decline Push Ups", imageName: "decline-push-ups"),
        Exercise(name: "Decline Sit Ups", imageName: "decline-sit-ups"),
        Exercise(name: "Dips", imageName: "dips"),
        Exercise(name: "Donkey Calf Raise", imageName: "donkey-calf-raise"),
        Exercise(name: "Dumbbell Bench Press", imageName: "dumbbell-bench-press"),
        Exercise(name: "Dumbbell Deadlift", imageName: "dumbbell-deadlift"),
        Exercise(name: "Dumbbell Floor Flys", imageName: "dumbbell-floor-flys"),
        Exercise(name: "Dumbbell Lunges", imageName: "dumbbell-lunges"),
        Exercise(name: "Dumbbell Romanian Deadlift", imageName: "dumbbell-romanian-deadlift"),
        Exercise(name: "Dumbbell Seated Overhead Tricep Extension", imageName: "dumbbell-seated-overhead-tricep-extension"),
        Exercise(name: "Dumbbell Shoulder Press", imageName: "dumbbell-shoulder-press"),
        Exercise(name: "Dumbbell Skullcrusher", imageName: "dumbbell-skullcrusher"),
        Exercise(name: "Dumbbell Squats", imageName: "dumbbell-squats"),
        Exercise(name: "Dumbbell Tricep Extension", imageName: "dumbbell-tricep-extension"),
        Exercise(name: "Dumbbell Upright Row", imageName: "dumbbell-upright-row"),
        Exercise(name: "Finger Curls", imageName: "finger-curls"),
        Exercise(name: "Flys", imageName: "flys"),
        Exercise(name: "Front Raise", imageName: "front-raise"),
        Exercise(name: "Front Squats", imageName: "front-squats"),
        Exercise(name: "Good Mornings", imageName: "good-mornings"),
        Exercise(name: "Hack Squat", imageName: "hack-squat"),
        Exercise(name: "Hammer Curls", imageName: "hammer-curls"),
        Exercise(name: "Hammer Grip Pull Ups", imageName: "hammer-grip-pull-ups"),
        Exercise(name: "Hammer Grip Wrist Curls", imageName: "hammer-grip-wrist-curls"),
        Exercise(name: "Hanging Knee Raise", imageName: "hanging-knee-raise"),
        Exercise(name: "Hanging Leg Curl", imageName: "hanging-leg-curl"),
        Exercise(name: "High Cable Curls", imageName: "high-cable-curls"),
        Exercise(name: "Hip Adduction", imageName: "hip-adduction"),
        Exercise(name: "Hyperextension on the Bench", imageName: "hyperextension-on-the-bench"),
        Exercise(name: "Hyperextension Side Bends", imageName: "hyperextension-side-bends"),
        Exercise(name: "Incline Barbell Press", imageName: "incline-barbell-press"),
        Exercise(name: "Incline Bench Preacher Curls", imageName: "incline-bench-preacher-curls"),
        Exercise(name: "Incline Cable Fly", imageName: "incline-cable-fly"),
        Exercise(name: "Incline Chest Press", imageName: "incline-chest-press"),
        Exercise(name: "Incline Dumbbell Biceps Curls", imageName: "incline-dumbbell-biceps-curls"),
        Exercise(name: "Incline Dumbbell Fly", imageName: "incline-dumbbell-fly"),
        Exercise(name: "Incline Dumbbell Press", imageName: "incline-dumbbell-press"),
        Exercise(name: "Incline Dumbbell Row", imageName: "incline-dumbell-row"), // asset uses 'dumbell'
        Exercise(name: "Inverted Row", imageName: "inverted-row"),
        Exercise(name: "Kickbacks", imageName: "kickbacks"),
        Exercise(name: "Knee Raise", imageName: "knee-raise"),
        Exercise(name: "Lat Pulldown on the Machine", imageName: "lat-pulldown-on-the-machine"),
        Exercise(name: "Lateral Raise", imageName: "lateral-raise"),
        Exercise(name: "Leg Extensions", imageName: "leg-extensions"),
        Exercise(name: "Lunges", imageName: "lunges"),
        Exercise(name: "Lying Back Extension", imageName: "lying-back-extension"),
        Exercise(name: "Lying Leg Curl", imageName: "lying-leg-curl"),
        Exercise(name: "Machine Fly", imageName: "machine-fly"),
        Exercise(name: "Neck Lat Pulldown", imageName: "neck-lat-pulldown"),
        Exercise(name: "Neck Pull Ups", imageName: "neck-pull-ups"),
        Exercise(name: "Oblique Leg Raises", imageName: "oblique-leg-raises"),
        Exercise(name: "One Arm Overhead Tricep Extension", imageName: "one-arm-overhead-tricep-extension"),
        Exercise(name: "Overhead Tricep Extension", imageName: "overhead-tricep-extension"),
        Exercise(name: "Preacher Curls", imageName: "preacher-curls"),
        Exercise(name: "Prone Incline Dumbbell Shrug", imageName: "prone-incline-dumbell-shrug"), // dumbell in asset
        Exercise(name: "Pull Over", imageName: "pull-over"),
        Exercise(name: "Pull Ups", imageName: "pull-ups"),
        Exercise(name: "Push Ups with Exercise Ball", imageName: "push-ups-with-exercise-ball"),
        Exercise(name: "Push Ups", imageName: "push-ups"),
        Exercise(name: "Resistance Band Chest Press", imageName: "resistance-band-chest-press"),
        Exercise(name: "Resistance Band Deadlift", imageName: "resistance-band-deadlift"),
        Exercise(name: "Resistance Band Kickbacks", imageName: "resistance-band-kickbacks"),
        Exercise(name: "Resistance Band Row", imageName: "resistance-band-row"),
        Exercise(name: "Resistance Band Shrugs", imageName: "resistance-band-shrugs"),
        Exercise(name: "Resistance Band Upright Row", imageName: "resistance-band-upright-row"),
        Exercise(name: "Reverse Butterfly", imageName: "reverse-butterfly"),
        Exercise(name: "Reverse Crunches", imageName: "reverse-crunches"),
        Exercise(name: "Reverse Flys", imageName: "reverse-flys"),
        Exercise(name: "Reverse Standing Wrist Curl", imageName: "reverse-standing-wrist-curl"),
        Exercise(name: "Reversed Incline Bench Barbell Curls", imageName: "reversed-incline-bench-barbell-curls"),
        Exercise(name: "Romanian Deadlift", imageName: "romanian-deadlift"),
        Exercise(name: "Rotary Torso Machine", imageName: "rotary-torso-machine"),
        Exercise(name: "Scissor Kicks", imageName: "scissor-kicks"),
        Exercise(name: "Seated Back Extension", imageName: "seated-back-extension"),
        Exercise(name: "Seated Barbell Calf Raise", imageName: "seated-barbell-calf-raise"),
        Exercise(name: "Seated Dumbbell Calf Raise", imageName: "seated-dumbbell-calf-raise"),
        Exercise(name: "Seated Good Mornings", imageName: "seated-good-mornings"),
        Exercise(name: "Seated Leg Press", imageName: "seated-leg-press"),
        Exercise(name: "Seated Machine Calf Raises", imageName: "seated-machine-calf-raises"),
        Exercise(name: "Seated Machine Row", imageName: "seated-machine-row"),
        Exercise(name: "Seated Shoulder Press with Resistance Band", imageName: "seated-shoulder-press-with-resistance-band"),
        Exercise(name: "Shrugs", imageName: "shrugs"),
        Exercise(name: "Side Bends", imageName: "side-bends"),
        Exercise(name: "Side Lunge", imageName: "side-lunge"),
        Exercise(name: "Single Arm Dumbbell Row", imageName: "single-arm-dumbbell-row"),
        Exercise(name: "Sit Ups", imageName: "sit-ups"),
        Exercise(name: "Squats", imageName: "squats"),
        Exercise(name: "Stability Ball Back Extension", imageName: "stability-ball-back-extension"),
        Exercise(name: "Standing Abdominal Twist", imageName: "standing-abdominal-twist"),
        Exercise(name: "Standing Barbell Calf Raise", imageName: "standing-barbell-calf-raise"),
        Exercise(name: "Standing Calf Raise", imageName: "standing-calf-raise"),
        Exercise(name: "Step Ups Sideways with Dumbbells", imageName: "step-ups-sideways-with-dumbbells"),
        Exercise(name: "Step Ups", imageName: "step-ups"),
        Exercise(name: "Straight Arm Pulldown", imageName: "straight-arm-pulldown"),
        Exercise(name: "Sumo Deadlift", imageName: "sumo-deadlift"),
        Exercise(name: "T Bar Row", imageName: "t-bar-row"),
        Exercise(name: "Triceps Cable Kickbacks", imageName: "triceps-cable-kickbacks"),
        Exercise(name: "Upright Barbell Row", imageName: "upright-barbell-row"),
        Exercise(name: "Wide Grip Pull Ups", imageName: "wide-grip-pull-ups"),
        Exercise(name: "Windshield Wipers", imageName: "windshield-wipers"),
        Exercise(name: "Wrist Curls with Dumbbells", imageName: "wrist-curls-with-dumbbells"),
        Exercise(name: "Zercher Squat", imageName: "zercher-squat")
    ]
}

enum ExerciseCategory: String, CaseIterable, Identifiable {
    case chest
    case back
    case shoulders
    case arms
    case legs
    case core
    case calves
    case fullBody
    case other

    var id: String { rawValue }

    var title: String {
        switch self {
        case .chest:      return "Chest"
        case .back:       return "Back"
        case .shoulders:  return "Shoulders"
        case .arms:       return "Arms"
        case .legs:       return "Legs & Glutes"
        case .core:       return "Core & Abs"
        case .calves:     return "Calves"
        case .fullBody:   return "Full Body"
        case .other:      return "Other"
        }
    }
}

func category(for exercise: Exercise) -> ExerciseCategory {
    let name = exercise.name.lowercased()

    // Core
    if name.contains("crunch")
        || name.contains("twist")
        || name.contains("knee raise")
        || name.contains("leg raise")
        || name.contains("oblique")
        || name.contains("ab wheel")
        || name.contains("torso")
        || name.contains("windshield") {
        return .core
    }

    // Calves
    if name.contains("calf") {
        return .calves
    }

    // Chest
    if name.contains("bench press")
        || name.contains("chest press")
        || name.contains("fly")
        || name.contains("push ups")
        || name.contains("push ups")
        || name.contains("pullover")
        || name.contains("push ups") {
        return .chest
    }

    // Back
    if name.contains("row")
        || name.contains("pulldown")
        || name.contains("pull ups")
        || name.contains("good mornings")
        || name.contains("hyperextension")
        || name.contains("back extension")
        || name.contains("t bar")
        || name.contains("shrug") {
        return .back
    }

    // Shoulders
    if name.contains("press") && name.contains("shoulder")
        || name.contains("overhead press")
        || name.contains("arnold press")
        || name.contains("lateral raise")
        || name.contains("front raise") {
        return .shoulders
    }

    // Arms (biceps / triceps / forearms)
    if name.contains("curl")
        || name.contains("curls")
        || name.contains("biceps")
        || name.contains("tricep")
        || name.contains("skull")
        || name.contains("wrist")
        || name.contains("kickback") {
        return .arms
    }

    // Legs & glutes
    if name.contains("squat")
        || name.contains("deadlift")
        || name.contains("lunge")
        || name.contains("step up")
        || name.contains("leg press")
        || name.contains("leg curl")
        || name.contains("leg extension")
        || name.contains("hack squat")
        || name.contains("zercher") {
        return .legs
    }

    // Full body-ish / banded / misc
    if name.contains("mountain climbers")
        || name.contains("banded")
        || name.contains("resistance band") {
        return .fullBody
    }

    return .other
}

enum MuscleFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case chest = "Chest"
    case back = "Back"
    case shoulders = "Shoulders"
    case arms = "Arms"
    case legs = "Legs & Glutes"
    case core = "Core & Abs"
    case calves = "Calves"
    case fullBody = "Full Body"
    case other = "Other"

    var id: String { rawValue }

    var mappedCategory: ExerciseCategory? {
        switch self {
        case .all:        return nil
        case .chest:      return .chest
        case .back:       return .back
        case .shoulders:  return .shoulders
        case .arms:       return .arms
        case .legs:       return .legs
        case .core:       return .core
        case .calves:     return .calves
        case .fullBody:   return .fullBody
        case .other:      return .other
        }
    }
}

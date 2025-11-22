import SwiftUI

enum QuizData {
    static let allQuestions: [QuizQuestion] = [
        // Machines (16 questions)
        QuizQuestion(
            category: .machines,
            question: "What muscle group does the leg press primarily target?",
            answers: ["Chest", "Quadriceps", "Back", "Shoulders"],
            correctIndex: 1,
            explanation: "The leg press primarily works your quads, glutes, and hamstrings."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine is best for training your lats?",
            answers: ["Leg curl machine", "Lat pulldown", "Pec deck", "Leg extension"],
            correctIndex: 1,
            explanation: "The lat pulldown is designed to target your latissimus dorsi muscles."
        ),
        QuizQuestion(
            category: .machines,
            question: "What does the smith machine help stabilize?",
            answers: ["Your mood", "The barbell path", "Your diet", "Your schedule"],
            correctIndex: 1,
            explanation: "The smith machine locks the barbell into a fixed vertical path."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine targets the hamstrings?",
            answers: ["Chest press", "Leg curl", "Shoulder press", "Cable crossover"],
            correctIndex: 1,
            explanation: "The leg curl machine isolates and strengthens the hamstrings."
        ),
        QuizQuestion(
            category: .machines,
            question: "What is the primary benefit of the cable machine?",
            answers: ["Fixed movement pattern", "Constant tension throughout the movement", "Lighter weights only", "Cardio training"],
            correctIndex: 1,
            explanation: "Cables provide constant tension on the muscles throughout the entire range of motion."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine is safest for beginners doing squats?",
            answers: ["Free barbell", "Smith machine", "Hack squat", "Leg extension"],
            correctIndex: 1,
            explanation: "The smith machine provides a guided path and safety catches, making it ideal for beginners."
        ),
        QuizQuestion(
            category: .machines,
            question: "What does the pec deck machine primarily work?",
            answers: ["Chest muscles", "Back muscles", "Leg muscles", "Core muscles"],
            correctIndex: 0,
            explanation: "The pec deck isolates the pectoralis major and minor chest muscles."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine is best for training calves?",
            answers: ["Leg press", "Calf raise machine", "Leg curl", "Hip abductor"],
            correctIndex: 1,
            explanation: "The calf raise machine specifically targets the gastrocnemius and soleus muscles."
        ),
        QuizQuestion(
            category: .machines,
            question: "What is the main advantage of using machines over free weights?",
            answers: ["They're always better", "Isolation and stability", "Less muscle activation", "Faster results"],
            correctIndex: 1,
            explanation: "Machines provide stability and allow for better muscle isolation, especially for beginners."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine helps strengthen the rotator cuff?",
            answers: ["Leg press", "Cable external rotation", "Bench press", "Lat pulldown"],
            correctIndex: 1,
            explanation: "Cable external rotations are excellent for strengthening the rotator cuff muscles."
        ),
        QuizQuestion(
            category: .machines,
            question: "What does the seated row machine primarily target?",
            answers: ["Chest", "Back and rear deltoids", "Legs", "Triceps"],
            correctIndex: 1,
            explanation: "Seated rows work the lats, rhomboids, traps, and rear deltoids."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine is best for hip abductor training?",
            answers: ["Leg press", "Hip abduction machine", "Leg curl", "Smith machine"],
            correctIndex: 1,
            explanation: "The hip abduction machine specifically targets the gluteus medius and minimus."
        ),
        QuizQuestion(
            category: .machines,
            question: "What is the benefit of the preacher curl machine?",
            answers: ["Works legs", "Isolates biceps and prevents cheating", "Targets back", "Improves cardio"],
            correctIndex: 1,
            explanation: "The preacher curl bench prevents momentum and isolates the biceps for better development."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine provides the best quad isolation?",
            answers: ["Leg curl", "Leg extension", "Calf raise", "Hip adduction"],
            correctIndex: 1,
            explanation: "The leg extension machine isolates the quadriceps without hamstring involvement."
        ),
        QuizQuestion(
            category: .machines,
            question: "What does the chest press machine simulate?",
            answers: ["Pull-ups", "Bench press", "Squats", "Deadlifts"],
            correctIndex: 1,
            explanation: "The chest press machine mimics the bench press motion with added stability."
        ),
        QuizQuestion(
            category: .machines,
            question: "Which machine is ideal for building grip strength?",
            answers: ["Leg press", "Cable machine with various grips", "Pec deck", "Leg extension"],
            correctIndex: 1,
            explanation: "Cable machines with different grip attachments are excellent for developing grip strength."
        ),
        
        // Trivia (16 questions)
        QuizQuestion(
            category: .trivia,
            question: "Who is known as 'The Austrian Oak'?",
            answers: ["Ronnie Coleman", "Arnold Schwarzenegger", "Jay Cutler", "Dorian Yates"],
            correctIndex: 1,
            explanation: "Arnold Schwarzenegger earned this nickname during his bodybuilding career."
        ),
        QuizQuestion(
            category: .trivia,
            question: "How many Mr. Olympia titles did Arnold win?",
            answers: ["5", "6", "7", "8"],
            correctIndex: 2,
            explanation: "Arnold won 7 Mr. Olympia titles from 1970-1975 and 1980."
        ),
        QuizQuestion(
            category: .trivia,
            question: "Who holds the record for most Mr. Olympia wins?",
            answers: ["Arnold Schwarzenegger", "Lee Haney", "Ronnie Coleman", "Both Lee Haney and Ronnie Coleman"],
            correctIndex: 3,
            explanation: "Both Lee Haney and Ronnie Coleman won 8 Mr. Olympia titles each."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What is a 'PR' in gym terminology?",
            answers: ["Public Relations", "Personal Record", "Protein Ratio", "Push Routine"],
            correctIndex: 1,
            explanation: "PR stands for Personal Record - your best performance on an exercise."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What does 'DOMS' stand for?",
            answers: ["Delayed Onset Muscle Soreness", "Daily Optimal Muscle Strength", "Dynamic Overhead Movement System", "Direct Overload Muscle Stimulation"],
            correctIndex: 0,
            explanation: "DOMS is the muscle pain that appears 24-48 hours after intense exercise."
        ),
        QuizQuestion(
            category: .trivia,
            question: "Who popularized the term 'No pain, no gain'?",
            answers: ["Arnold Schwarzenegger", "Jane Fonda", "Jack LaLanne", "Joe Weider"],
            correctIndex: 1,
            explanation: "Jane Fonda popularized this phrase in the 1980s fitness movement."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What is the 'big 3' in powerlifting?",
            answers: ["Curl, Press, Row", "Squat, Bench Press, Deadlift", "Run, Jump, Throw", "Pull-up, Push-up, Dip"],
            correctIndex: 1,
            explanation: "The big 3 compound lifts are squat, bench press, and deadlift."
        ),
        QuizQuestion(
            category: .trivia,
            question: "Who invented the barbell?",
            answers: ["Arnold Schwarzenegger", "Bob Hoffman", "Alan Calvert", "Joe Weider"],
            correctIndex: 2,
            explanation: "Alan Calvert invented the adjustable plate-loading barbell in 1902."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What does 'CrossFit' emphasize?",
            answers: ["Bodybuilding only", "Varied functional movements at high intensity", "Yoga and meditation", "Long distance running"],
            correctIndex: 1,
            explanation: "CrossFit focuses on constantly varied functional movements performed at high intensity."
        ),
        QuizQuestion(
            category: .trivia,
            question: "Who is known as 'The Blade'?",
            answers: ["Phil Heath", "Dexter Jackson", "Jay Cutler", "Flex Wheeler"],
            correctIndex: 1,
            explanation: "Dexter Jackson earned the nickname 'The Blade' for his razor-sharp conditioning."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What year was the first Mr. Olympia competition?",
            answers: ["1955", "1965", "1970", "1975"],
            correctIndex: 1,
            explanation: "The first Mr. Olympia competition was held in 1965 in New York."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What is a 'pump' in bodybuilding?",
            answers: ["A type of protein shake", "Temporary muscle swelling from blood flow", "A cardio machine", "A stretching technique"],
            correctIndex: 1,
            explanation: "The pump is temporary muscle swelling caused by increased blood flow during exercise."
        ),
        QuizQuestion(
            category: .trivia,
            question: "Who created the 'Bulgarian Split Squat'?",
            answers: ["Bulgarian weightlifting coach", "Arnold Schwarzenegger", "CrossFit founder", "Powerlifting champion"],
            correctIndex: 0,
            explanation: "This exercise was developed by Bulgarian weightlifting coaches for leg development."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What does 'reps' stand for?",
            answers: ["Representatives", "Repetitions", "Reports", "Repairs"],
            correctIndex: 1,
            explanation: "Reps is short for repetitions - the number of times you perform an exercise."
        ),
        QuizQuestion(
            category: .trivia,
            question: "What is 'German Volume Training'?",
            answers: ["5 sets of 5 reps", "10 sets of 10 reps", "3 sets of 8 reps", "20 sets of 1 rep"],
            correctIndex: 1,
            explanation: "GVT is a high-volume protocol using 10 sets of 10 reps to promote muscle growth."
        ),
        QuizQuestion(
            category: .trivia,
            question: "Who was the first woman to win Ms. Olympia?",
            answers: ["Rachel McLish", "Cory Everson", "Lenda Murray", "Iris Kyle"],
            correctIndex: 0,
            explanation: "Rachel McLish won the inaugural Ms. Olympia competition in 1980."
        ),
        
        // Fun Facts (16 questions)
        QuizQuestion(
            category: .funFacts,
            question: "What happens to your muscles after an intense workout?",
            answers: ["They shrink", "They get tiny tears", "They turn blue", "They multiply"],
            correctIndex: 1,
            explanation: "Muscle growth happens when tiny tears repair and grow back stronger!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "Which is the largest muscle in your body?",
            answers: ["Bicep", "Gluteus maximus", "Heart", "Quadriceps"],
            correctIndex: 1,
            explanation: "Your glutes are the largest muscles in the human body!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "How many muscles does it take to smile?",
            answers: ["5", "12", "26", "43"],
            correctIndex: 2,
            explanation: "It takes about 26 muscles to smile - a great face workout!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "What's the strongest muscle relative to its size?",
            answers: ["Bicep", "Masseter (jaw)", "Calf", "Heart"],
            correctIndex: 1,
            explanation: "Your jaw muscle can close teeth with a force of 200 pounds!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "How many muscles are in the human body?",
            answers: ["206", "350", "Over 600", "1000"],
            correctIndex: 2,
            explanation: "The human body has over 600 muscles working together!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "What percentage of your body weight is muscle?",
            answers: ["10-20%", "30-40%", "50-60%", "70-80%"],
            correctIndex: 1,
            explanation: "Muscle typically makes up 30-40% of total body weight in healthy adults."
        ),
        QuizQuestion(
            category: .funFacts,
            question: "Which muscle never gets tired?",
            answers: ["Bicep", "Heart", "Calf", "Abs"],
            correctIndex: 1,
            explanation: "The heart beats continuously without resting, pumping blood 24/7!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "How fast can muscle fibers contract?",
            answers: ["0.01 seconds", "0.5 seconds", "2 seconds", "5 seconds"],
            correctIndex: 0,
            explanation: "Some muscle fibers can contract in as little as 0.01 seconds!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "What's the smallest muscle in your body?",
            answers: ["Eye muscle", "Stapedius in the ear", "Finger muscle", "Toe muscle"],
            correctIndex: 1,
            explanation: "The stapedius in your middle ear is the smallest muscle, controlling sound vibrations."
        ),
        QuizQuestion(
            category: .funFacts,
            question: "How much force can the quadriceps generate?",
            answers: ["50 pounds", "100 pounds", "300 pounds", "600+ pounds"],
            correctIndex: 3,
            explanation: "The quadriceps can generate over 600 pounds of force when fully contracted!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "What happens to unused muscles?",
            answers: ["They disappear", "They atrophy (shrink)", "They turn to fat", "Nothing"],
            correctIndex: 1,
            explanation: "Unused muscles undergo atrophy - 'use it or lose it' is scientifically accurate!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "How long does it take to build noticeable muscle?",
            answers: ["1 week", "2-3 weeks", "6-8 weeks", "1 year"],
            correctIndex: 2,
            explanation: "Most people see noticeable muscle growth after 6-8 weeks of consistent training."
        ),
        QuizQuestion(
            category: .funFacts,
            question: "What percentage of daily calories do muscles burn?",
            answers: ["5-10%", "20-30%", "50-60%", "80-90%"],
            correctIndex: 1,
            explanation: "Muscles account for about 20-30% of your resting metabolic rate!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "Can muscles turn into fat?",
            answers: ["Yes, if you stop working out", "No, they're different tissues", "Only if you eat poorly", "Yes, but only slowly"],
            correctIndex: 1,
            explanation: "Muscle and fat are completely different tissues - one cannot transform into the other!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "What color are muscle fibers?",
            answers: ["Red or white", "Blue", "Green", "Clear"],
            correctIndex: 0,
            explanation: "Muscles have red (slow-twitch) and white (fast-twitch) fibers based on their function!"
        ),
        QuizQuestion(
            category: .funFacts,
            question: "How much blood can working muscles demand?",
            answers: ["10% of cardiac output", "25% of cardiac output", "50% of cardiac output", "80% of cardiac output"],
            correctIndex: 3,
            explanation: "During intense exercise, working muscles can demand up to 80% of your heart's blood output!"
        ),
        
        // Science (16 questions)
        QuizQuestion(
            category: .science,
            question: "How much protein should you eat per kg of body weight daily?",
            answers: ["0.5-0.8g", "1.6-2.2g", "3-4g", "5g+"],
            correctIndex: 1,
            explanation: "Research suggests 1.6-2.2g per kg of body weight for muscle building."
        ),
        QuizQuestion(
            category: .science,
            question: "How long is the 'anabolic window' after a workout?",
            answers: ["15 minutes", "It's actually several hours", "Exactly 30 minutes", "24 hours"],
            correctIndex: 1,
            explanation: "Recent research shows the anabolic window is much longer than previously thought!"
        ),
        QuizQuestion(
            category: .science,
            question: "How long should you rest between sets for muscle growth?",
            answers: ["10 seconds", "30-90 seconds", "5 minutes", "No rest needed"],
            correctIndex: 1,
            explanation: "30-90 seconds is optimal for hypertrophy training."
        ),
        QuizQuestion(
            category: .science,
            question: "What does 'progressive overload' mean?",
            answers: ["Eating more each week", "Gradually increasing training demands", "Overtraining", "Loading the bar unevenly"],
            correctIndex: 1,
            explanation: "Progressive overload means gradually increasing weight, reps, or intensity over time."
        ),
        QuizQuestion(
            category: .science,
            question: "What is hypertrophy?",
            answers: ["Muscle shrinkage", "Muscle growth", "Fat loss", "Bone density increase"],
            correctIndex: 1,
            explanation: "Hypertrophy is the scientific term for muscle growth and enlargement."
        ),
        QuizQuestion(
            category: .science,
            question: "What rep range is best for hypertrophy?",
            answers: ["1-5 reps", "6-12 reps", "15-20 reps", "30+ reps"],
            correctIndex: 1,
            explanation: "6-12 reps is the traditional hypertrophy range, though recent research shows broader ranges work."
        ),
        QuizQuestion(
            category: .science,
            question: "What is muscle protein synthesis?",
            answers: ["Breaking down muscle", "Building new muscle proteins", "Storing fat", "Burning calories"],
            correctIndex: 1,
            explanation: "MPS is the process of building new muscle proteins after training and feeding."
        ),
        QuizQuestion(
            category: .science,
            question: "How many hours of sleep are optimal for recovery?",
            answers: ["4-5 hours", "6 hours", "7-9 hours", "12+ hours"],
            correctIndex: 2,
            explanation: "7-9 hours of quality sleep is optimal for muscle recovery and growth."
        ),
        QuizQuestion(
            category: .science,
            question: "What is creatine's primary function?",
            answers: ["Build muscle directly", "Regenerate ATP for energy", "Burn fat", "Increase flexibility"],
            correctIndex: 1,
            explanation: "Creatine helps regenerate ATP, providing quick energy for high-intensity exercise."
        ),
        QuizQuestion(
            category: .science,
            question: "What is 'time under tension'?",
            answers: ["Total workout time", "Time muscles are working during a set", "Rest period", "Warm-up duration"],
            correctIndex: 1,
            explanation: "TUT is the total time a muscle is under strain during a set, important for growth."
        ),
        QuizQuestion(
            category: .science,
            question: "What causes muscle soreness after training?",
            answers: ["Lactic acid buildup", "Microscopic muscle damage", "Dehydration only", "Low protein"],
            correctIndex: 1,
            explanation: "DOMS is caused by microscopic damage to muscle fibers and subsequent inflammation."
        ),
        QuizQuestion(
            category: .science,
            question: "What is the role of testosterone in muscle building?",
            answers: ["No role", "Promotes protein synthesis and muscle growth", "Only burns fat", "Decreases muscle"],
            correctIndex: 1,
            explanation: "Testosterone is anabolic, promoting protein synthesis and muscle development."
        ),
        QuizQuestion(
            category: .science,
            question: "How many calories does 1 pound of muscle burn per day?",
            answers: ["1-2 calories", "6-10 calories", "50 calories", "100 calories"],
            correctIndex: 1,
            explanation: "One pound of muscle burns approximately 6-10 calories per day at rest."
        ),
        QuizQuestion(
            category: .science,
            question: "What is eccentric training?",
            answers: ["Fast lifting", "The lowering phase of an exercise", "Cardio only", "Stretching"],
            correctIndex: 1,
            explanation: "Eccentric training emphasizes the lowering phase, causing more muscle damage and growth."
        ),
        QuizQuestion(
            category: .science,
            question: "What is muscle glycogen?",
            answers: ["A protein", "Stored carbohydrate in muscles", "A vitamin", "A hormone"],
            correctIndex: 1,
            explanation: "Glycogen is the stored form of carbohydrates in muscles, used for energy during exercise."
        ),
        QuizQuestion(
            category: .science,
            question: "What is the 'pump' scientifically?",
            answers: ["Permanent muscle growth", "Cellular swelling from blood and fluid", "Fat loss", "Nerve activation"],
            correctIndex: 1,
            explanation: "The pump is temporary cellular swelling caused by increased blood flow and fluid to muscles."
        ),
        
        // Nutrition (12 questions)
        QuizQuestion(
            category: .nutrition,
            question: "What is the primary macronutrient for muscle building?",
            answers: ["Carbohydrates", "Protein", "Fats", "Vitamins"],
            correctIndex: 1,
            explanation: "Protein provides amino acids essential for muscle repair and growth."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "How many calories are in 1 gram of protein?",
            answers: ["2 calories", "4 calories", "7 calories", "9 calories"],
            correctIndex: 1,
            explanation: "Both protein and carbohydrates contain 4 calories per gram."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "What are BCAAs?",
            answers: ["B Vitamins", "Branched-Chain Amino Acids", "Bacterial Cultures", "Basic Carb Absorption Agents"],
            correctIndex: 1,
            explanation: "BCAAs are leucine, isoleucine, and valine - essential amino acids for muscle building."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "When is the best time to consume carbs for training?",
            answers: ["Never", "Before and after workouts", "Only at breakfast", "Only at night"],
            correctIndex: 1,
            explanation: "Carbs before workouts provide energy, and after workouts help with recovery."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "What percentage of calories should come from protein for muscle gain?",
            answers: ["5-10%", "15-30%", "50-60%", "80-90%"],
            correctIndex: 1,
            explanation: "15-30% of daily calories from protein is optimal for most people building muscle."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "Are all protein sources equal?",
            answers: ["Yes", "No - complete proteins have all essential amino acids", "Only plant proteins are good", "Only animal proteins work"],
            correctIndex: 1,
            explanation: "Complete proteins contain all 9 essential amino acids needed for muscle growth."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "What is leucine's role in muscle building?",
            answers: ["No specific role", "Triggers muscle protein synthesis", "Provides energy only", "Stores as fat"],
            correctIndex: 1,
            explanation: "Leucine is the key amino acid that signals the body to build muscle protein."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "Should you eat before morning workouts?",
            answers: ["Never", "It depends on your goals and preference", "Always", "Only protein"],
            correctIndex: 1,
            explanation: "Some people perform better fasted, others need fuel - both approaches can work."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "What is a caloric surplus?",
            answers: ["Eating less than you burn", "Eating more than you burn", "Eating exactly what you burn", "Not eating carbs"],
            correctIndex: 1,
            explanation: "A caloric surplus provides extra energy needed for muscle growth."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "Why are healthy fats important for lifters?",
            answers: ["They're not", "Hormone production and vitamin absorption", "Only for cardio", "To gain fat"],
            correctIndex: 1,
            explanation: "Fats are essential for testosterone production and absorbing vitamins A, D, E, and K."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "What is the glycemic index?",
            answers: ["Protein quality scale", "How quickly carbs raise blood sugar", "Fat content measure", "Vitamin levels"],
            correctIndex: 1,
            explanation: "The glycemic index measures how quickly foods raise blood glucose levels."
        ),
        QuizQuestion(
            category: .nutrition,
            question: "Is meal timing critical for muscle growth?",
            answers: ["Yes, you must eat every 2 hours", "Total daily intake matters more than timing", "Only breakfast matters", "Never eat after 6pm"],
            correctIndex: 1,
            explanation: "While timing can help, total daily protein and calories matter most for muscle growth."
        ),
        
        // Technique (12 questions)
        QuizQuestion(
            category: .technique,
            question: "What is the most important factor in preventing injury?",
            answers: ["Lifting heavy", "Proper form and technique", "Speed of lifting", "Training every day"],
            correctIndex: 1,
            explanation: "Proper form reduces injury risk and ensures you're targeting the right muscles."
        ),
        QuizQuestion(
            category: .technique,
            question: "Should you lock out your joints during exercises?",
            answers: ["Always fully lock", "It depends on the exercise", "Never lock out", "Only on leg exercises"],
            correctIndex: 1,
            explanation: "Some exercises benefit from lockout, others maintain tension by not fully locking."
        ),
        QuizQuestion(
            category: .technique,
            question: "What does 'mind-muscle connection' mean?",
            answers: ["Thinking about muscles", "Consciously focusing on the working muscle", "Meditation", "Mental toughness"],
            correctIndex: 1,
            explanation: "Actively focusing on the muscle you're working improves activation and growth."
        ),
        QuizQuestion(
            category: .technique,
            question: "What is the valsalva maneuver?",
            answers: ["A stretching technique", "Holding breath and bracing during heavy lifts", "A warm-up exercise", "A cooldown method"],
            correctIndex: 1,
            explanation: "The valsalva maneuver increases intra-abdominal pressure for spine stability during heavy lifts."
        ),
        QuizQuestion(
            category: .technique,
            question: "Should you train to failure on every set?",
            answers: ["Yes, always", "No, training close to failure is usually sufficient", "Only on biceps", "Never"],
            correctIndex: 1,
            explanation: "Training to failure every set can lead to excessive fatigue - most sets should be close to failure."
        ),
        QuizQuestion(
            category: .technique,
            question: "What is the proper squat depth?",
            answers: ["Quarter squat", "Parallel or below", "Just bend slightly", "Touch the floor"],
            correctIndex: 1,
            explanation: "Squatting to at least parallel (hip crease below knee) ensures full muscle engagement."
        ),
        QuizQuestion(
            category: .technique,
            question: "What is the scapula's role in bench press?",
            answers: ["No role", "Should be retracted and depressed", "Should be elevated", "Should move freely"],
            correctIndex: 1,
            explanation: "Retracting and depressing the scapula creates a stable base and protects shoulders."
        ),
        QuizQuestion(
            category: .technique,
            question: "What is the 'dead' in deadlift?",
            answers: ["Lifting while tired", "Starting from a dead stop on the floor", "A dangerous lift", "For advanced only"],
            correctIndex: 1,
            explanation: "Each rep starts from a complete stop (dead weight) on the floor, hence 'dead' lift."
        ),
        QuizQuestion(
            category: .technique,
            question: "Should you bounce the bar off your chest during bench press?",
            answers: ["Yes, for momentum", "No, control the weight", "Only when heavy", "Only for powerlifters"],
            correctIndex: 1,
            explanation: "Bouncing can cause injury and reduces muscle tension - control the descent and press."
        ),
        QuizQuestion(
            category: .technique,
            question: "What is a 'neutral spine'?",
            answers: ["A perfectly flat back", "Natural spinal curves maintained", "An arched back", "A rounded back"],
            correctIndex: 1,
            explanation: "Neutral spine maintains the natural S-curve, crucial for safe lifting."
        ),
        QuizQuestion(
            category: .technique,
            question: "What does 'breaking at the hips' mean?",
            answers: ["Injuring your hips", "Initiating movement by hinging at hips", "Stretching", "A dance move"],
            correctIndex: 1,
            explanation: "Many exercises like squats and deadlifts should initiate with hip hinge movement."
        ),
        QuizQuestion(
            category: .technique,
            question: "Why is full range of motion important?",
            answers: ["It's not", "Maximizes muscle fiber recruitment and growth", "Looks better", "Takes longer"],
            correctIndex: 1,
            explanation: "Full ROM ensures complete muscle activation and development throughout the entire muscle."
        ),
        QuizQuestion(
            category: .technique,
            question: "What is the proper breathing for most exercises?",
            answers: ["Hold breath entire time", "Exhale on exertion, inhale on return", "Breathe randomly", "Never breathe"],
            correctIndex: 1,
            explanation: "Exhaling during the hard part and inhaling during the easier part is generally optimal."
        ),
    ]
    
    static func questions(for category: QuizCategory, count: Int = 10) -> [QuizQuestion] {
        let categoryQuestions = allQuestions.filter { $0.category == category }
        return Array(categoryQuestions.shuffled().prefix(count))
    }
}

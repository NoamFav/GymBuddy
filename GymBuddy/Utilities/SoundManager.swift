import AVFoundation
import SwiftUI
import Combine

class SoundManager: ObservableObject {
    static let shared = SoundManager()
    
    private var players: [String: AVAudioPlayer] = [:]
    @Published var isSoundEnabled: Bool = true
    
    private init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    enum SoundEffect: String {
        case correct = "correct"
        case wrong = "wrong"
        case buttonTap = "tap"
        case completion = "completion"
        case swipe = "swipe"
        
        var fileName: String {
            switch self {
            case .correct: return "correct.mp3"
            case .wrong: return "wrong.mp3"
            case .buttonTap: return "tap.mp3"
            case .completion: return "completion.mp3"
            case .swipe: return "swipe.mp3"
            }
        }
    }
    
    func play(_ sound: SoundEffect) {
        guard isSoundEnabled else { return }
        
        // If player already exists, use it
        if let player = players[sound.rawValue] {
            player.currentTime = 0
            player.play()
            return
        }
        
        // Otherwise, create a new player
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: sound.fileName.components(separatedBy: ".").last) else {
            print("Could not find sound file: \(sound.fileName)")
            // Fallback to system sound
            playSystemSound(for: sound)
            return
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            players[sound.rawValue] = player
            player.play()
        } catch {
            print("Could not play sound: \(error)")
            playSystemSound(for: sound)
        }
    }
    
    private func playSystemSound(for sound: SoundEffect) {
        // Fallback to system sounds if custom sounds aren't available
        let systemSoundID: SystemSoundID
        
        switch sound {
        case .correct:
            systemSoundID = 1057 // Tink sound
        case .wrong:
            systemSoundID = 1053 // Tock sound
        case .buttonTap:
            systemSoundID = 1104 // Click sound
        case .completion:
            systemSoundID = 1057 // Tink sound
        case .swipe:
            systemSoundID = 1104 // Click sound
        }
        
        AudioServicesPlaySystemSound(systemSoundID)
    }
    
    func playHaptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        guard isSoundEnabled else { return }
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func playNotificationHaptic(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        guard isSoundEnabled else { return }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func toggleSound() {
        isSoundEnabled.toggle()
        
        // Save preference
        UserDefaults.standard.set(isSoundEnabled, forKey: "soundEnabled")
        
        // Play feedback when toggling
        if isSoundEnabled {
            playHaptic(.light)
        }
    }
    
    func loadSoundPreference() {
        if UserDefaults.standard.object(forKey: "soundEnabled") != nil {
            isSoundEnabled = UserDefaults.standard.bool(forKey: "soundEnabled")
        }
    }
}

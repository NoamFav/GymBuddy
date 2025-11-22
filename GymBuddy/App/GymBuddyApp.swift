//
//  GymBuddyApp.swift
//  GymBuddy
//
//  Created by Boss on 22/11/2025.
//

import SwiftUI

@main
struct GymBuddyApp: App {
    @StateObject private var quizManager = QuizManager.shared
    @State private var isLoading = true
    
    init() {
        SoundManager.shared.loadSoundPreference()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isLoading {
                    LoadingScreen()
                        .transition(.opacity)
                } else {
                    ContentView()
                        .transition(.opacity)
                }
            }
            .onAppear {
                // Wait for quiz data to load
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    checkLoadingStatus()
                }
            }
            .onChange(of: quizManager.isLoading) { oldValue, newValue in
                if !newValue {
                    // Add a minimum display time for the loading screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isLoading = false
                        }
                    }
                }
            }
        }
    }
    
    private func checkLoadingStatus() {
        // Check if quiz manager is still loading
        if quizManager.isLoading {
            // Check again after a short delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                checkLoadingStatus()
            }
        } else {
            // Data is loaded, dismiss loading screen with animation
            withAnimation(.easeInOut(duration: 0.5)) {
                isLoading = false
            }
        }
    }
}

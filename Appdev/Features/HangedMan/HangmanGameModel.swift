//
//  HangmanGameModel.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//


import SwiftUI

@MainActor
class HangmanGameModel: ObservableObject {
    @Published var currentWord = ""
    @Published var currentHint = ""
    @Published var guessedLetters: Set<Character> = []
    @Published var wrongGuesses = 0
    @Published var gameState: GameState = .menu
    @Published var selectedDifficulty: GameDifficulty = .medium
    @Published var isLoading = false
    
    private let geminiService = GeminiGameService()
    private let maxWrongGuesses = 6
    
    var displayWord: String {
        currentWord.map { letter in
            guessedLetters.contains(letter) ? String(letter) : "_"
        }.joined(separator: " ")
    }
    
    var isGameWon: Bool {
        currentWord.allSatisfy { guessedLetters.contains($0) }
    }
    
    var isGameLost: Bool {
        wrongGuesses >= maxWrongGuesses
    }
    
    // 🎮 Start New Game
    func startNewGame() async {
        isLoading = true
        resetGame()
        
        do {
            let result = try await geminiService.generateWordWithHint(difficulty: selectedDifficulty)
            currentWord = result.word
            currentHint = result.hint
            gameState = .playing
        } catch {
            // Use fallback if API fails
            let fallback = getFallbackGame()
            currentWord = fallback.word
            currentHint = fallback.hint
            gameState = .playing
        }
        
        isLoading = false
    }
    
    // 🎯 Make Guess
    func makeGuess(_ letter: Character) {
        guard gameState == .playing && !guessedLetters.contains(letter) else { return }
        
        guessedLetters.insert(letter)
        
        if !currentWord.contains(letter) {
            wrongGuesses += 1
        }
        
        // Check win/lose conditions
        if isGameWon {
            gameState = .won
        } else if isGameLost {
            gameState = .lost
        }
    }
    
    private func resetGame() {
        currentWord = ""
        currentHint = ""
        guessedLetters = []
        wrongGuesses = 0
        gameState = .playing
    }
    
    private func getFallbackGame() -> (word: String, hint: String) {
        return ("swift", "Apple's programming language")
    }
}

enum GameState {
    case menu, playing, won, lost
}

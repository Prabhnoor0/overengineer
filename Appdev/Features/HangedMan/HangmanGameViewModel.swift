//
//  HangmanGameViewModel.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//



import SwiftUI

@MainActor
class HangmanGameViewModel: ObservableObject {
    @Published var currentWord = ""
    @Published var currentHint = ""
    @Published var guessedLetters: Set<Character> = []
    @Published var wrongGuesses = 0
    @Published var gameState: GameState = .menu
    @Published var isLoading = false
    
    private let geminiService = GeminiGameService()
    private let maxWrongGuesses = 6
    private let difficulty: GameDifficulty
    
    init(difficulty: GameDifficulty) {
        self.difficulty = difficulty
    }
    
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
    
    
    func startNewGame() async {
        isLoading = true
        resetGame()
        
        do {
            let result = try await geminiService.generateWordWithHint(difficulty: difficulty)
            currentWord = result.word
            currentHint = result.hint
            gameState = .playing
        } catch {
            let fallback = getFallbackGame()
            currentWord = fallback.word
            currentHint = fallback.hint
            gameState = .playing
        }
        
        isLoading = false
    }
    
    
    func makeGuess(_ letter: Character) {
        guard gameState == .playing && !guessedLetters.contains(letter) else { return }
        
        guessedLetters.insert(letter)
        
        if !currentWord.contains(letter) {
            wrongGuesses += 1
        }
        
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
        switch difficulty {
        case .easy:
            return ("apple", "Red or green fruit")
        case .medium:
            return ("computer", "Electronic device")
        case .hard:
            return ("programming", "Writing code")
        }
    }
}

enum GameState {
    case menu
    case playing
    case won
    case lost
}

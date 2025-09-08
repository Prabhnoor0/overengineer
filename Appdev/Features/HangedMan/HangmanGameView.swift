//
//  HangmanGameView.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//


import SwiftUI

struct HangmanGameView: View {
    @StateObject private var gameModel = HangmanGameModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🎯 AI Hangman")
                .font(.largeTitle)
                .bold()
            
            // 🎚️ Difficulty Selection (only show in menu)
            if gameModel.gameState == .menu {
                VStack(spacing: 15) {
                    Text("Choose your difficulty:")
                        .font(.headline)
                    
                    Picker("Difficulty", selection: $gameModel.selectedDifficulty) {
                        ForEach(GameDifficulty.allCases, id: \.self) { difficulty in
                            Text(difficulty.rawValue).tag(difficulty)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    Button("🚀 Start Game") {
                        Task {
                            await gameModel.startNewGame()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(gameModel.isLoading)
                    
                    if gameModel.isLoading {
                        ProgressView("Generating word...")
                            .padding()
                    }
                }
            }
            
            // 🎮 Game Playing State
            if gameModel.gameState == .playing || gameModel.gameState == .won || gameModel.gameState == .lost {
                
                // 🎨 Hangman Drawing
                Text(hangmanDrawing(wrongGuesses: gameModel.wrongGuesses))
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                // 📝 Word Display
                Text(gameModel.displayWord)
                    .font(.system(size: 32, weight: .bold, design: .monospaced))
                    .tracking(8)
                    .padding()
                
                // 💡 Hint Display
                Text("💡 \(gameModel.currentHint)")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // ⌨️ Alphabet Buttons (only during gameplay)
                if gameModel.gameState == .playing {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6)) {
                        ForEach("ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0 }, id: \.self) { letter in
                            Button(String(letter)) {
                                gameModel.makeGuess(Character(letter.lowercased()))
                            }
                            .frame(width: 40, height: 40)
                            .background(gameModel.guessedLetters.contains(Character(letter.lowercased())) ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .disabled(gameModel.guessedLetters.contains(Character(letter.lowercased())))
                        }
                    }
                    .padding(.horizontal)
                }
                
                // 🎯 Game End Messages
                if gameModel.gameState == .won {
                    Text("🎉 You Won!")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding()
                }
                
                if gameModel.gameState == .lost {
                    VStack {
                        Text("💀 Game Over!")
                            .font(.title)
                            .foregroundColor(.red)
                        Text("The word was: \(gameModel.currentWord.uppercased())")
                            .font(.headline)
                            .padding()
                    }
                }
                
                // 🔄 Play Again Button
                if gameModel.gameState == .won || gameModel.gameState == .lost {
                    Button("🔄 Play Again") {
                        Task {
                            await gameModel.startNewGame()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(gameModel.isLoading)
                }
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func hangmanDrawing(wrongGuesses: Int) -> String {
        let stages = [
            """
              +---+
              |   |
                  |
                  |
                  |
                  |
            =========
            """,
            """
              +---+
              |   |
              O   |
                  |
                  |
                  |
            =========
            """,
            """
              +---+
              |   |
              O   |
              |   |
                  |
                  |
            =========
            """,
            """
              +---+
              |   |
              O   |
             /|   |
                  |
                  |
            =========
            """,
            """
              +---+
              |   |
              O   |
             /|\\  |
                  |
                  |
            =========
            """,
            """
              +---+
              |   |
              O   |
             /|\\  |
             /    |
                  |
            =========
            """,
            """
              +---+
              |   |
              O   |
             /|\\  |
             / \\  |
                  |
            =========
            """
        ]
        
        return stages[min(wrongGuesses, stages.count - 1)]
    }
}

#Preview {
    HangmanGameView()
}

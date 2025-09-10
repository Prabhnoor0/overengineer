//
//  HangmanGameView.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//


import SwiftUI

struct HangmanGameView: View {
    @StateObject private var gameModel: HangmanGameViewModel
    
    init(selectedDifficulty: GameDifficulty) {
        _gameModel = StateObject(wrappedValue: HangmanGameViewModel(difficulty: selectedDifficulty))
    }
    let columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Hangman")
                    .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8460006209)))
                    .font(.largeTitle)
                    .bold()
                if gameModel.gameState == .playing || gameModel.gameState == .won || gameModel.gameState == .lost {
                    Text(hangmanDrawing(wrongGuesses: gameModel.wrongGuesses))
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .background(Color(hex: "#E6E6FA"))
                        .opacity(0.6)
                        .cornerRadius(10)
                    
                    Text(gameModel.displayWord)
                        .font(.system(size: 32, weight: .bold, design: .monospaced))
                        .tracking(8)
                        .padding()
                    
                   
                    Text("\(gameModel.currentHint)")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color(hex: "#E6E6FA")).opacity(0.6)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
        
                    if gameModel.gameState == .playing {
                        LazyVGrid(columns: columns) {
                            ForEach("ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0 }, id: \.self) { letter in
                                Button(String(letter)) {
                                    gameModel.makeGuess(Character(letter.uppercased()))
                                }
                                .frame(width: 40, height: 40)
                                .background(gameModel.guessedLetters.contains(Character(letter.uppercased())) ? Color.gray : Color(hex:"#F97272"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .disabled(gameModel.guessedLetters.contains(Character(letter.lowercased())))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                  
                    if gameModel.gameState == .won {
                        Text("You Won!")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                    }
                    
                    if gameModel.gameState == .lost {
                        VStack {
                            Text("Game Over!")
                                .font(.title)
                                .foregroundColor(.red)
                            Text("The word was: \(gameModel.currentWord.uppercased())")
                                .font(.headline)
                                .padding()
                        }
                    }
                    
                  
                    if gameModel.gameState == .won || gameModel.gameState == .lost {
                        Button(action: {
                            Task {
                                await gameModel.startNewGame()
                            }
                        }) {
                            Text(" Play Again")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 28)
                                .padding(.vertical, 14)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: "EFA59A"))
                                .cornerRadius(14)
                                .shadow(color: Color.black.opacity(0.25), radius: 6, x: 0, y: 4)
                        }
                        .disabled(gameModel.isLoading)
                        .padding(.horizontal, 40)
                    }

                } else if gameModel.isLoading {
                    ProgressView("Generating word...")
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
        .task {
            await gameModel.startNewGame()
        }
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
    HangmanGameView(selectedDifficulty: .easy)
}

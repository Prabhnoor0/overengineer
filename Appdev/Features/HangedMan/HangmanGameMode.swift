//
//  HangmanGameMode.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//


import SwiftUI

struct HangmanGameMode: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Text("Select Game Mode")
                        .font(.custom("MarkerFelt-Thin", size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                        .padding(.bottom, 20)
                    
                    GameModeButton(title: "Easy", destination:  HangmanGameView(selectedDifficulty: .easy))
                    GameModeButton(title: "Medium", destination: HangmanGameView(selectedDifficulty: .hard))
                    GameModeButton(title: "Hard", destination: HangmanGameView(selectedDifficulty: .hard))
                    GameModeButton(title: "Rules", destination: HangmanRules())
                  
                
                }
            }
        }
    }
}

#Preview {
    HangmanGameMode()
}

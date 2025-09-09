//
//  GameMode.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//

import SwiftUI

struct GameMode: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("background3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Text("Select Game Mode")
                        .font(.custom("MarkerFelt-Thin", size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8069898593)))
                        .padding(.bottom, 20)
                    GameModeButton(title: "Easy", destination:  MemoryGameEasy())
                    GameModeButton(title: "Medium", destination: MemoryGameMedium())
                    GameModeButton(title: "Hard", destination: MemoryGameHard())
                    GameModeButton(title: "Rules", destination: MemoryGamerules())
                        
                }
                
            }
        }
    }
}

#Preview {
    GameMode()
}

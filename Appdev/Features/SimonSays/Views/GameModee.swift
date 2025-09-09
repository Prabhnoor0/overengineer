//
//  GameMode.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//

import SwiftUI

struct GameModee: View {
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
                    GameModeButton(title: "Easy", destination: SimonSays())
                    GameModeButton(title: "Medium", destination: SimonSaysMedium())
                    GameModeButton(title: "Hard", destination: SimonSaysHard())
                    GameModeButton(title: "Rules", destination: SimonSaysRules())
                        
                    
                    
                }
            }
        }
    }
}

#Preview {
    GameModee()
}

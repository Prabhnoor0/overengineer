//
//  GameModee.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 30/08/25.
//



import SwiftUI

struct GameMode1: View {
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
                    GameModeButton(title: "Easy", subtitle: "Mines: 5", destination: MinesGame())
                    GameModeButton(title: "Medium", subtitle: "Mines: 7", destination: MinesGameMedium())
                    GameModeButton(title: "Hard", subtitle: "Mines: 9", destination: MinesGameHard())
                    GameModeButton(title: "Rules", destination: MinesRules())
                        
                        
                
                }
                
            }
        }
    }
}

#Preview {
    GameMode1()
}

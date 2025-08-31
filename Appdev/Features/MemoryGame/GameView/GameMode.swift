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
                    NavigationLink(destination: MemoryGameEasy()) {
                        Text("Easy")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                            .frame(width:200,height:80)
                            .background(Color(hex: "#E6E6FA"))
                            .opacity(0.8)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MemoryGameMedium()) {
                        Text("Medium")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                            .frame(width:200,height:80)
                            .background(Color(hex: "#E6E6FA"))
                            .opacity(0.8)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MemoryGameHard()) {
                        Text("Hard")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                            .frame(width:200,height:80)
                            .background(Color(hex: "#E6E6FA"))
                            .opacity(0.8)
                            .cornerRadius(20)
                        
                        
                    }
                    NavigationLink(destination: MemoryGamerules()) {
                        Text("Rules")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                            .frame(width:200,height:80)
                            .background(Color(hex: "#E6E6FA"))
                            .opacity(0.8)
                            .cornerRadius(20)
                        
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    GameMode()
}

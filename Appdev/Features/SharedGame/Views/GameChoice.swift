//
//  GameChoice.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//

import SwiftUI

struct GameChoice: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("background3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("Choose Game")
                        .font(.custom("MarkerFelt-Thin", size: 46))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8069898593)))
                        .padding(.bottom, 70)
                      
                    NavigationLink(destination: GameMode()) {
                        Text("Memory Game")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                            .frame(width:200,height:80)
                            .background(Color(hex: "#E6E6FA"))
                            .opacity(0.8)
                            .cornerRadius(20)
                    }
                    .padding(.bottom, 20)
                        NavigationLink(destination: GameModee()) {
                           Text("Simon Says")
                             .font(.custom("MarkerFelt-Thin", size: 28))
                             .fontWeight(.bold)
                             .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                             .frame(width:200,height:80)
                             .background(Color(hex: "#E6E6FA"))
                             .opacity(0.8)
                             .cornerRadius(20)
                    }
                    .padding(.bottom, 20)
                        NavigationLink(destination: GameMode1()) {
                              Text("Mines Game")
                                .font(.custom("MarkerFelt-Thin", size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                                .frame(width:200,height:80)
                                .background(Color(hex: "#E6E6FA"))
                                .opacity(0.8)
                                .cornerRadius(20)
                            
                    }
                    .padding(.bottom, 20)
                    NavigationLink(destination: HangmanGameMode()) {
                        Text("HangMan")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                            .frame(width:200,height:80)
                            .background(Color(hex: "#E6E6FA"))
                            .opacity(0.8)
                            .cornerRadius(20)
                    }
                    Spacer()
                    }
                }
            }
        }
    }


#Preview {
    GameChoice()
}

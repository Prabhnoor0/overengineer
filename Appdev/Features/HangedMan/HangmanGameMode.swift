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
                    
                  
                    NavigationLink(destination: HangmanGameView(selectedDifficulty: .easy)) {
                        VStack {
                            Text("Easy")
                                .font(.custom("MarkerFelt-Thin", size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                            Text("4-6 letters")
                                .font(.caption)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                                .fontWeight(.bold)
                        }
                        .frame(width: 200, height: 80)
                        .background(Color(.sRGB, red: 230/255, green: 230/255, blue: 250/255, opacity: 1))
                        .opacity(0.8)
                        .cornerRadius(20)
                    }
                    
                    
                    NavigationLink(destination: HangmanGameView(selectedDifficulty: .medium)) {
                        VStack {
                            Text("Medium")
                                .font(.custom("MarkerFelt-Thin", size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                            Text("7-9 letters")
                                .font(.caption)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                                .fontWeight(.bold)
                        }
                        .frame(width: 200, height: 80)
                        .background(Color(.sRGB, red: 230/255, green: 230/255, blue: 250/255, opacity: 1))
                        .opacity(0.8)
                        .cornerRadius(20)
                    }
                    
                  
                    NavigationLink(destination: HangmanGameView(selectedDifficulty: .hard)) {
                        VStack {
                            Text("Hard")
                                .font(.custom("MarkerFelt-Thin", size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                            Text("10+ letters")
                                .font(.caption)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                                .fontWeight(.bold)
                        }
                        .frame(width: 200, height: 80)
                        .background(Color(.sRGB, red: 230/255, green: 230/255, blue: 250/255, opacity: 1))
                        .opacity(0.8)
                        .cornerRadius(20)
                    }
                    
                   
                    NavigationLink(destination: HangmanRules()) {
                        Text("Rules")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8331177566)))
                            .frame(width: 200, height: 80)
                            .background(Color(.sRGB, red: 230/255, green: 230/255, blue: 250/255, opacity: 1))
                            .opacity(0.8)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

#Preview {
    HangmanGameMode()
}

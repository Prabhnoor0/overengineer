//
//  SimonSaysHard.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 30/08/25.
//


import SwiftUI

struct SimonSaysHard: View {
    @StateObject private var viewModel = SimonSaysGameView(mode: .hard)
        let columns = Array(repeating: GridItem(.flexible()), count: 4)
        
        var body: some View {
           
                ZStack{
                    Image("background7")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                   
                    
                    VStack {
                        Text("Simon Says")
                            .font(.custom("MarkerFelt-Thin", size: 46))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8460006209)))
                            .padding(.bottom, 40)
                        HStack(spacing:100)
                        {
                            Text("Player 1: \(viewModel.score[0])")
                                .font(.custom("MarkerFelt-Thin", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8460006209)))
                            Text("Player 2: \(viewModel.score[1])")
                                .font(.custom("MarkerFelt-Thin", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8460006209)))
                        }                           // Centered square grid
                        LazyVGrid(columns: columns, spacing: 5) {
                                               ForEach(Array(viewModel.cardss.enumerated()), id: \.element.id) { index, card in
                                                   Image(card.image)
                                                       .resizable()
                                                       .aspectRatio(contentMode: .fill)
                                                       .frame(width: 90, height: 72)
                                                       .clipped()
                                                       .cornerRadius(8)
                                                       .overlay(
                                                           RoundedRectangle(cornerRadius: 8)
                                                               .stroke(isHighlighted(index) ? Color.pink : Color.clear, lineWidth: 4)
                                                               .animation(.easeInOut(duration: 0.2), value: isHighlighted(index))
                                                       )
                                                       .onTapGesture {
                                                           if !viewModel.isShowing {
                                                               viewModel.playerTapped(index)
                                                           }
                                                       }
                                               }
                                           }
                                           .frame(width: 400, height: 400)
                                           .cornerRadius(16)
                                           .shadow(radius: 5)
                                           
                                          
                                       }
                                       .frame(maxWidth: .infinity, maxHeight: .infinity)
                                   }
                                   .navigationDestination(isPresented: $viewModel.gameOver) {
                                       WinningPage(viewModel: viewModel)
                                   }
                                   .onAppear {
                                       DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                           viewModel.newRound()
                                       }
                                   }
                               }
                           
                           
                           // Highlight function to show yellow box around squares
                           private func isHighlighted(_ index: Int) -> Bool {
                               return viewModel.highlightedCard == index
                           }
}

                       #Preview {
                           SimonSaysHard()
                       }

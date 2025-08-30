//
//  HangedMan.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//

import SwiftUI

struct SimonSays: View {
    @ObservedObject var viewModel:SimonSaysGameView
        let columns = Array(repeating: GridItem(.flexible()), count: 4)
        
        var body: some View {
           
                ZStack{
                    Image("background7")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                   
                    
                    VStack {
                        Text("Simon Says")
                            .font(.custom("MarkerFelt-Thin", size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .padding(.bottom, 20)
                        HStack(spacing:20)
                        {
                            Text("Player 1: \(viewModel.score[0])")
                                .font(.custom("MarkerFelt-Thin", size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            Text("Player 2: \(viewModel.score[1])")
                                .font(.custom("MarkerFelt-Thin", size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }                // Centered square grid
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(viewModel.cardss) { card in
                                FlipCard(
                               
                                    
                                
                                )
                            

                                
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(8)
                            }
                        }
                        .frame(width: 400, height: 400)
                        
                        .cornerRadius(16)
                        .shadow(radius: 5)
                        Button("New Game") {
                            viewModel.resetgame()
                        }
                        .padding(6)
                        .background(.ultraThinMaterial)
                        .cornerRadius(8)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
            }
        }





#Preview {
    SimonSays(viewModel: SimonSaysGameView())
}

//
//  MemoryGameMedium.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//

import SwiftUI

struct MemoryGameMedium: View {
    @StateObject private var viewModel = MemoryGameViewModel(mode: .medium)
let columns = Array(repeating: GridItem(.flexible()), count: 4)

    var body: some View {
        // let card1 = cards.shuffled()
        NavigationStack{
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Memory Game")
                    .font(.custom("MarkerFelt-Thin", size: 46))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8460006209)))
                    .padding(.bottom, 40)
                HStack(spacing:100)
                       {
                    Text("Player 1: \(viewModel.score[0])")
                        .font(.custom("MarkerFelt-Thin", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8485616722)))
                    Text("Player 2: \(viewModel.score[1])")
                        .font(.custom("MarkerFelt-Thin", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8485616722)))
                }
                       .padding(.bottom,20)
                       Text("Player \(viewModel.currplayid+1) turn")
                           .font(.custom("MarkerFelt-Thin", size: 20))
                           .fontWeight(.bold)
                           .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8460006209)))
               
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(viewModel.cards.indices, id: \.self) { index in
                        let card = viewModel.cards[index]
                        FlipCard(
                            frontImage: card.frontImage,
                            backImage: card.backImage,
                            isMatched: card.isMatched,
                            isFlipped:
                                card.isFlipped,
                            onFlip: {
                                viewModel.flipCard(at: index)
                            }
                                )
                                    .aspectRatio(1, contentMode: .fit)
                                                                .cornerRadius(8)
                            
                        }
                    }
                    .frame(width: 400, height: 400)
                    
                    .cornerRadius(16)
                    .shadow(radius: 5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
        .navigationDestination(isPresented: $viewModel.gameended) {
                      WinningPagee(viewModel: viewModel)
                  }
        }
    }
}

#Preview {
   MemoryGameMedium()
}



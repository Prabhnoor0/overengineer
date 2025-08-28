//
//  MemoryGameHard.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//

import SwiftUI

struct MemoryGameHard: View {
        @StateObject private var viewModel = MemoryGameViewModel(mode: .hard)
let columns = Array(repeating: GridItem(.flexible()), count: 4)

    var body: some View {
        
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Memory Game")
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
                }
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
                .frame(width: 400, height: 500)
                
                .cornerRadius(16)
                .shadow(radius: 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           
        }
    }
}

#Preview {
   MemoryGameHard()
}



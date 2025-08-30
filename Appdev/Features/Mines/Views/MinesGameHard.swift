//
//  MinesGame 3.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 30/08/25.
//


import SwiftUI

struct MinesGameHard: View {
    @StateObject private var viewModel = MinesGameViewModel(mode: .hard)
    let columns = Array(repeating: GridItem(.flexible()), count: 4)
    var body: some View {
        NavigationStack{
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Mines Game")
                    .font(.custom("MarkerFelt-Thin", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
                Text("Score: \(viewModel.score[0])")
                    .font(.custom("MarkerFelt-Thin", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(viewModel.cards1.indices, id: \.self) { index in
                        let card = viewModel.cards1[index]
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
                        .navigationDestination(isPresented: $viewModel.gameover) {
                            winningPage1(viewModel: viewModel)
                }
            }
        }
    }



#Preview {
    MinesGameHard()
}


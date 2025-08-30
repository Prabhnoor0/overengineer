//
//  SwiftUIView.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//

import SwiftUI

struct MinesGame: View {
    @StateObject private var viewModel = MinesGameViewModel(mode: .medium)
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

                ForEach(viewModel.cards1) { card in
                    FlipCard(
                        frontImage: card.frontImage,
                        backImage: card.backImage,
                        isMatched: card.isMatched,
                        isFlipped: card.isFlipped, onFlip: <#() -> Void#>
                    )
                }



                }
            }
        }
    }



#Preview {
    MinesGame()
}


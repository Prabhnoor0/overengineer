//
//  WinningPage.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//

import SwiftUI

struct WinningPage: View {
    @ObservedObject var viewModel: SimonSaysGameView
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Text(viewModel.winnertext)
                .font(.custom("MarkerFelt-Thin", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8069898593)))
                .padding(.bottom, 20)
                
        }
    }
}


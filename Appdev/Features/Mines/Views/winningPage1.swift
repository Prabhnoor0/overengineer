//
//  WinningPagee.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 30/08/25.
//




import SwiftUI

struct winningPage1: View {
    @ObservedObject var viewModel: MinesGameViewModel
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Text(viewModel.winnertext1)
                .font(.system(size: 50, weight: .bold, design: .default))
                
        }
    }
}


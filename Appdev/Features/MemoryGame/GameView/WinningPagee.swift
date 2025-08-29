//
//  WinningPage.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//


import SwiftUI

struct WinningPagee: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Text(viewModel.winnertext1)
                .font(.system(size: 30, weight: .bold, design: .default))
                
        }
    }
}


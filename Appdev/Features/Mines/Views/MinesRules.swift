
//
//  MinesRules.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 30/08/25.
//

import SwiftUI

struct MinesRules: View {
    var body: some View {
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Mines Game Rules")
                    .font(.custom("MarkerFelt-Thin", size: 46))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8339973096)))
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("• The grid has hidden mines.")
                    Text("• Tap a tile to reveal it.")
                    Text("• Numbers show how many mines are nearby.")
                    Text("• Avoid the mines — hitting one ends the game.")
                    Text("• Clear all safe tiles to win.")
                    
                }
                .font(.custom("MarkerFelt-Thin", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8339973096)))
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(20)
                .shadow(radius: 6)
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    MinesRules()
}

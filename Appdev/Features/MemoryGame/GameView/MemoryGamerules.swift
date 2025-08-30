//
//  MemoryGamerules.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 30/08/25.
//

import SwiftUI

struct MemoryGamerules: View {
    var body: some View {
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                
                Text("\tMemory Game Rules")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.58, green: 0.07, blue: 0.0, alpha: 1.0)))
                    .padding(.bottom, 10)
                
                
                Text("""
                • Cards are laid face down.  
                • On your turn, flip 2 cards.  
                • If they match → keep them and go again.  
                • If not → turn them back and next player plays.  
                • Game ends when all cards are matched.  
                • Most pairs = winner!
                """)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.0, blue: 0.0, alpha: 1.0)))
                .padding()
                .background(Color(#colorLiteral(red: 1.0, green: 0.93, blue: 0.90, alpha: 1.0)))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 3)
            }
            .padding()
        }
    }
}

#Preview {
    MemoryGamerules()
}

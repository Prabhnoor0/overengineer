//
//  HangmanRules.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//


import SwiftUI

struct HangmanRules: View {
    var body: some View {
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                
                Text("\tHangMan Game Rules")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.58, green: 0.07, blue: 0.0, alpha: 1.0)))
                    .padding(.bottom, 10)
                
                
                Text("""
                • Guess the word by choosing letters.
                • You can make up to 6 wrong guesses. 
                • Correct guesses reveal their positions.
                • Use the hint if you’re stuck.  
                • On the 6th wrong guess, game ends.
                
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
    HangmanRules()
}



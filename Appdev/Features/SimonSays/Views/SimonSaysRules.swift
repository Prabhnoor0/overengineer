//
//  SimonSaysRules.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 30/08/25.
//

import SwiftUI

struct SimonSaysRules: View {
    var body: some View {
        ZStack{
            Image("background7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Simon Says\n\t\tRules")
                    .font(.custom("MarkerFelt-Thin", size: 46))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8339973096)))
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("• Photos light up in a sequence.")
                    Text("• Follow the sequence by tapping in order.")
                    Text("• Each round adds one more photo.")
                    Text("• The first player to fail the sequence loses.")
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
    SimonSaysRules()
}

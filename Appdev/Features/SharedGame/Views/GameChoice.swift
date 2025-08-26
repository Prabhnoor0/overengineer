//
//  GameChoice.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//

import SwiftUI

struct GameChoice: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Choose Game")
                    .font(.custom("MarkerFelt-Thin", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8069898593)))
                    .padding(.bottom, 20)
                NavigationLink(destination: GameMode()) {
                    Text("Memory Game")
                        .font(.custom("MarkerFelt-Thin", size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                        .frame(width:200,height:80)
                        .background(Color(hex: "#FFFFC5"))
                        .cornerRadius(20)
                }
            }
        }
    }
}

#Preview {
    GameChoice()
}

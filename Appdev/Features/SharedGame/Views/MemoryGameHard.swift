//
//  MemoryGameHard.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//

import SwiftUI

struct MemoryGameHard: View {
    var cards=[
        ("Cat","cat1"),("Cat","cat2"),
        ("Cat","cat3"),("Cat","cat4"),
        ("Cat","cat5"),("Cat","cat6"),
        ("Cat","cat7"), ("Cat","cat8"),
        ("Cat","cat9"),("Cat","cat10"),
        ("Cat","cat11"),("Cat","cat12"),
        ("Cat","cat1"),("Cat","cat2"),
        ("Cat","cat3"),("Cat","cat4"),
        ("Cat","cat5"),("Cat","cat6"),
        ("Cat","cat7"),("Cat","cat8"),
        ("Cat","cat9"),("Cat","cat10"),
        ("Cat","cat11"),("Cat","cat12")
    ]
let columns = Array(repeating: GridItem(.flexible()), count: 4)

   var body: some View {
       let card1 = cards.shuffled()
       
       VStack {
           Text("Memory Game")
               .font(.custom("MarkerFelt-Thin", size: 28))
               .fontWeight(.bold)
               .foregroundColor(.red)
               .padding(.bottom, 20)
           
           // Centered square grid
           LazyVGrid(columns: columns, spacing: 5) {
               ForEach(Array(card1.enumerated()), id: \.offset) { index, card in
                   FlipCard(frontImage: card.0, backImage: card.1)
                       .aspectRatio(1, contentMode: .fit)
                       .cornerRadius(8)
               }
           }
           .frame(width: 400, height: 600)
           .background(Color.white)
           .cornerRadius(16)
           .shadow(radius: 5)
       }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Color(.systemGray6))
   }
}

#Preview {
   MemoryGameHard()
}



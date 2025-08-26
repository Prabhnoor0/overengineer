//
//  GamePage.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//

import SwiftUI

struct MemoryGameEasy: View {
    var cards=[
        ("Cat","cat1"),("Cat","cat2"),
        ("Cat","cat3"),("Cat","cat4"),
        ("Cat","cat5"),("Cat","cat6"),
        ("Cat","cat1"),("Cat","cat2"),
        ("Cat","cat3"),("Cat","cat4"),
        ("Cat","cat5"),("Cat","cat6")
    ]
    /*   let columns = [
     GridItem(.flexible()),
     GridItem(.flexible()),
     GridItem(.flexible())
     ]
     
     var body: some View {
     let card1 = cards.shuffled()
     
     VStack{
     Text("Memory Game")
     .font(.custom("Marker Felt Thin", size: 24))
     .fontWeight(.bold)
     .foregroundStyle(Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)))
     .padding(100)
     LazyVGrid(columns: columns, spacing: 2){
     ForEach(card1, id: \.1) { card in
     FlipCard(frontImage: card.0, backImage: card.1)
     .frame(height: 200).scaledToFit()
     .cornerRadius(8)
     .shadow(radius: 2)
     .padding()
     }
     }.frame(width:400,height:400)
     .padding()
     }
     
     
     }
     }*/
    let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        let card1 = cards.shuffled()
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
                
                // Centered square grid
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(Array(card1.enumerated()), id: \.offset) { index, card in
                        FlipCard(frontImage: card.0, backImage: card.1)
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(8)
                    }
                }
                .frame(width: 400, height: 400)
              
                .cornerRadius(16)
                .shadow(radius: 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}

#Preview {
   MemoryGameEasy()
}



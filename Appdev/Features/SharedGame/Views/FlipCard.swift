//
//  FlipCard.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//


import SwiftUI

struct FlipCard: View {
  
    let frontImage: String
    let backImage: String
    let isMatched:Bool
    let isFlipped: Bool
    let onFlip: () -> Void
   // let iSFlipped:Bool

    var body: some View {
        ZStack {
           
            Image(frontImage)
                .resizable()
                .cornerRadius(20)
                .shadow(radius: 8)
                .opacity(isFlipped ? 0 : 1)
                .rotation3DEffect(.degrees(isFlipped ? 180 : 0),
                                  axis: (x: 0, y: 1, z: 0))

          
            Image(backImage)
                .resizable()
                .cornerRadius(20)
                .shadow(radius: 8)
                .opacity(isFlipped ? 1 : 0)
                .rotation3DEffect(.degrees(isFlipped ? 0 : -180),
                                  axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            if !isMatched{
                onFlip()
            }
        }

      

    }
}







//
//  FlipCard.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 26/08/25.
//


import SwiftUI

struct FlipCard: View {
    @State private var isFlipped = false
    let frontImage: String
    let backImage: String

    var body: some View {
        ZStack {
            // Front Image
            Image(frontImage)   // replace with your asset name
                .resizable()
               
               
              
                .cornerRadius(20)
                .shadow(radius: 8)
                .opacity(isFlipped ? 0 : 1)
                .rotation3DEffect(.degrees(isFlipped ? 180 : 0),
                                  axis: (x: 0, y: 1, z: 0))

            // Back Image
            Image(backImage)   // replace with your asset name
                .resizable()
               
               
              
                .cornerRadius(20)
                .shadow(radius: 8)
                .opacity(isFlipped ? 1 : 0)
                .rotation3DEffect(.degrees(isFlipped ? 0 : -180),
                                  axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isFlipped.toggle()
            }
        }
    }
}







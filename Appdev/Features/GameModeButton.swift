//
//  GameModeButton.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 09/09/25.
//


import SwiftUI

struct GameModeButton<Destination: View>: View {
    let title: String
    let subtitle: String?
    let destination: Destination

    init(title: String, subtitle: String? = nil, destination: Destination) {
        self.title = title
        self.subtitle = subtitle
        self.destination = destination
    }

    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Text(title)
                    .font(.custom("MarkerFelt-Thin", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.618067053)))
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(Color(#colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 0.6471957781)))
                        .fontWeight(.bold)
                }
            }
            .frame(width: 200, height: 80)
            .background(Color(hex: "#E6E6FA"))
            .opacity(0.8)
            .cornerRadius(20)
        }
    }
}

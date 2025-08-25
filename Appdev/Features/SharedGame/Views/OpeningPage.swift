//
//  Openingpage.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 25/08/25.
//

import SwiftUI


struct OpeningPage: View {
  
    var body: some View {
        
        ZStack{
            Color(hex: "#000080").ignoresSafeArea()
            VStack{
                
                Text("GameHub").font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundStyle(.conicGradient(.init(colors: [.blue, .red,.orange,.purple]),
                                                    center:.topLeading
                                                   )
                    )
                    .padding(80)
                Text("Tap to continue").font(.caption)
                    .fontWidth(.expanded)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    OpeningPage()
}

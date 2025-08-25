//
//  JoinRoomView.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 25/08/25.
//

import SwiftUI

struct JoinRoomView: View {
    var body: some View {
        ZStack{
            Text("Join Room")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex:"#F2F0EF"))
                .cornerRadius(20)
                .padding()
        }
        
    }
}
#Preview {
   JoinRoomView()
}

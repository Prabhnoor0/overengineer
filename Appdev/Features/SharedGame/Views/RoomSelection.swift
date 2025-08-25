//
//  RoomSelection.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 25/08/25.
//

import SwiftUI

struct RoomSelection: View {
    var body: some View {
            HStack{
                NavigationLink(destination: CreateRoomView()){
                    Text("create room")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }.buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: JoinRoomView()){
                    Text("join room")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }.buttonStyle(PlainButtonStyle())
            
            
            }
        
        
    }
}

#Preview {
    RoomSelection()
}


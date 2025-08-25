//
//  RoomSelection.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 25/08/25.
//

import SwiftUI

struct RoomSelection: View {
    var body: some View {
        ZStack{
            Color(hex: "#000080").ignoresSafeArea()
            HStack{
                NavigationLink(destination: CreateRoomView()){
                    Text("create room")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color(hex: "#F2F0EF"))
                        .cornerRadius(10)
                }.buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: JoinRoomView()){
                    Text("join room")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color(hex: "#F2F0EF"))

                        .cornerRadius(10)
                }.buttonStyle(PlainButtonStyle())
                
                
            }
        }
        
        
    }
}

#Preview {
    RoomSelection()
}


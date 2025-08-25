//
//  CreateRoomView.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 25/08/25.
//

import SwiftUI

struct CreateRoomView: View {
    @State private var name: String = ""
    @State private var members: Int?
    var body: some View {
        ZStack{
            Color(hex: "#000080").ignoresSafeArea()
            VStack{
                Text("Create Room")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex:"#F2F0EF"))
                    .cornerRadius(20)
                TextField("Enter nickname", text: $name)
                    .padding()
                TextField("Enter number of members", value: $members, format: .number)
                
            }
        }
    }
}
#Preview {
  CreateRoomView()
}


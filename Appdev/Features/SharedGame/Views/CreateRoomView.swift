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
        VStack{
            Text("Create Room")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
                .cornerRadius(20)
            TextField("Enter nickname", text: $name)
                .padding()
            TextField("Enter number of members", value: $members, format: .number)
            
        }
    }
}


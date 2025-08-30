//
//  Cards.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//

import SwiftUI
struct Cards: Identifiable {
    let id = UUID()
    let front: String
    let back: String
    var isMatched: Bool = false
    var isFlipped: Bool = false   
   
}

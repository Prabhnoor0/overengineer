//
//  Card.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 27/08/25.
//

import SwiftUI
struct Card: Identifiable {
    let id = UUID()
    let frontImage: String
    let backImage: String
    var isFlipped: Bool = false
    var isMatched: Bool = false
   
}

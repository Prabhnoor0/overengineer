//
//  Cards1.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//


 import SwiftUI
 struct Cards1: Identifiable {
 let id = UUID()
 let frontImage: String
 let backImage: String
 var isFlipped: Bool = false
 var isMatched: Bool = false
 
 }
 

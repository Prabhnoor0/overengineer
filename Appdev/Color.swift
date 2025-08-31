//
//  Color.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 25/08/25.
// template taken from internet

import SwiftUI

extension Color {
    init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b, a: Double
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (Double((int >> 8) * 17) / 255, Double(((int >> 4) & 0xF) * 17) / 255, Double((int & 0xF) * 17) / 255, 1)
        case 6: // RGB (24-bit)
            (r, g, b, a) = (Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255, 1)
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255, Double((int >> 24) & 0xFF) / 255)
        default:
            return nil
        }
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}




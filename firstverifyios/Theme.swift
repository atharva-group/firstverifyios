//
//  Theme.swift
//  firstverifyios
//
//  Color theme matching web UI
//

import SwiftUI

extension Color {
    // Primary brand colors
    static let fvPrimary = Color(hex: "#5d6f5e")
    static let fvPrimaryDark = Color(hex: "#4a5a4b")
    static let fvPrimaryLight = Color(hex: "#6f826f")
    static let fvVibrantGreen = Color(hex: "#2E7D32") // Richer, more vibrant green

    // Background colors
    static let fvBackground = Color(hex: "#f5f5f5")
    static let fvCard = Color.white

    // Text colors
    static let fvHeading = Color(hex: "#0F2608") // Darker, richer green for headings
    static let fvTextSecondary = Color(hex: "#4B5563")
    static let fvTextTertiary = Color(hex: "#6B7280")

    // Accent colors
    static let fvAccent = Color(hex: "#8a9a8b")
    static let fvWarning = Color(hex: "#C9A889")

    // Evidence support colors
    static let fvEvidenceStrong = Color(hex: "#6f826f")  // Sage green
    static let fvEvidenceWeak = Color(hex: "#e5e5e5")    // Light gray
    static let fvEvidenceNone = Color(hex: "#C9A889")     // Tan/beige

    // Initialize from hex string
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Font {
    static func generalSans(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let weightString: String
        switch weight {
        case .light: weightString = "Light"
        case .regular: weightString = "Regular"
        case .medium: weightString = "Medium"
        case .semibold: weightString = "Semibold"
        case .bold: weightString = "Bold"
        default: weightString = "Regular"
        }
        return .custom("GeneralSans-\(weightString)", size: size)
    }
}

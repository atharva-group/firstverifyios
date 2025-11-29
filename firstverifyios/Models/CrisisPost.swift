//
//  CrisisPost.swift
//  firstverifyios
//
//  Model for crisis reports
//

import Foundation

struct EvidenceSupport {
    let strong: Double  // 0.0 to 1.0
    let weak: Double    // 0.0 to 1.0
    let none: Double    // 0.0 to 1.0

    static func random() -> EvidenceSupport {
        // Generate random percentages that sum to 1.0
        let strong = Double.random(in: 0.5...0.9)
        let remaining = 1.0 - strong
        let weak = Double.random(in: 0.0...remaining)
        let none = 1.0 - strong - weak

        return EvidenceSupport(strong: strong, weak: weak, none: none)
    }
}

struct CrisisPost: Identifiable {
    let id = UUID()
    let title: String
    let distance: String
    let timeAgo: String
    let verificationScore: Double // 0.0 to 1.0
    let reportCount: Int
    let evidenceSupport: EvidenceSupport

    // Sample data for preview
    static let samples = [
        CrisisPost(
            title: "Road blocked on Highway 101",
            distance: "0.3 mi",
            timeAgo: "2m ago",
            verificationScore: 0.85,
            reportCount: 12,
            evidenceSupport: EvidenceSupport(strong: 0.80, weak: 0.15, none: 0.05)
        ),
        CrisisPost(
            title: "Water supply disrupted in downtown area",
            distance: "0.8 mi",
            timeAgo: "15m ago",
            verificationScore: 0.92,
            reportCount: 28,
            evidenceSupport: EvidenceSupport(strong: 0.88, weak: 0.10, none: 0.02)
        ),
        CrisisPost(
            title: "Emergency shelter open at community center",
            distance: "1.2 mi",
            timeAgo: "1h ago",
            verificationScore: 0.78,
            reportCount: 45,
            evidenceSupport: EvidenceSupport(strong: 0.72, weak: 0.20, none: 0.08)
        ),
        CrisisPost(
            title: "Power outage reported in residential zone",
            distance: "2.1 mi",
            timeAgo: "3h ago",
            verificationScore: 0.65,
            reportCount: 8,
            evidenceSupport: EvidenceSupport(strong: 0.60, weak: 0.25, none: 0.15)
        )
    ]
}

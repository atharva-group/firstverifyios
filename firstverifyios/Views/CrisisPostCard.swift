//
//  CrisisPostCard.swift
//  firstverifyios
//
//  Minimal card showing crisis report with verification bar
//

import SwiftUI

struct EvidenceBar: View {
    let evidence: EvidenceSupport

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                // Strong segment
                Rectangle()
                    .fill(Color.fvEvidenceStrong)
                    .frame(width: geometry.size.width * evidence.strong)

                // Weak segment
                Rectangle()
                    .fill(Color.fvEvidenceWeak)
                    .frame(width: geometry.size.width * evidence.weak)

                // None segment
                Rectangle()
                    .fill(Color.fvEvidenceNone)
                    .frame(width: geometry.size.width * evidence.none)
            }
        }
        .frame(height: 6)
        .clipShape(Rectangle())
    }
}

struct CrisisPostCard: View {
    let post: CrisisPost

    var barColor: Color {
        if post.verificationScore >= 0.8 {
            return Color.green.opacity(0.7)
        } else if post.verificationScore >= 0.5 {
            return Color.orange.opacity(0.7)
        } else {
            return Color.red.opacity(0.7)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {


                // Content
                VStack(alignment: .leading, spacing: 10) {
                    Text(post.title)
                        .font(.generalSans(17, weight: .semibold))
                        .foregroundColor(.fvHeading)
                        .lineLimit(2)
                        .lineSpacing(2)

                    HStack(spacing: 12) {
                        Label(post.distance, systemImage: "location.fill")
                            .font(.caption)
                            .foregroundColor(.fvTextSecondary)

                        Text(post.timeAgo)
                            .font(.caption)
                            .foregroundColor(.fvTextTertiary)

                        Spacer()

                        // Report count badge
                        HStack(spacing: 4) {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 10))
                            Text("\(post.reportCount)")
                                .font(.caption2)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.fvTextSecondary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.fvBackground)
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
            }

            // Evidence support bar at the bottom
            EvidenceBar(evidence: post.evidenceSupport)
        }
        .background(Color.fvCard)
        .clipShape(Rectangle())
        .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    VStack(spacing: 12) {
        CrisisPostCard(post: CrisisPost.samples[0])
        CrisisPostCard(post: CrisisPost.samples[1])
        CrisisPostCard(post: CrisisPost.samples[2])
    }
    .padding()
    .background(Color.fvBackground)
}

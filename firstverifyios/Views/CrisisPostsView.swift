//
//  CrisisPostsView.swift
//  firstverifyios
//
//  Reddit-like feed showing nearby crisis reports
//

import SwiftUI

struct CrisisPostsView: View {
    @State private var posts = CrisisPost.samples

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(posts) { post in
                        CrisisPostCard(post: post)
                            .transition(.opacity.combined(with: .scale(scale: 0.95)))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 32)
            }
            .background(Color.fvBackground.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 8) {
                        Image(systemName: "shield.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.fvHeading)
                        Text("FirstVerify")
                            .font(.generalSans(20, weight: .semibold))
                            .foregroundColor(.fvHeading)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CrisisPostsView()
}

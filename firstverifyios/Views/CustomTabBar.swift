//
//  CustomTabBar.swift
//  firstverifyios
//
//  Created by Antigravity on 29/11/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            // Tab 1: Fact Check AI
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = 0
                }
            }) {
                VStack(spacing: 4) {
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 24))
                    Text("Fact Check AI")
                        .font(.generalSans(10, weight: .medium))
                }
                .foregroundColor(selectedTab == 0 ? .fvVibrantGreen : .secondary)
                .frame(maxWidth: .infinity)
            }
            
            // Tab 2: Crisis Posts
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = 1
                }
            }) {
                VStack(spacing: 4) {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                        .font(.system(size: 22))
                    Text("Crisis Posts")
                        .font(.generalSans(10, weight: .medium))
                }
                .foregroundColor(selectedTab == 1 ? .fvVibrantGreen : .secondary)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .background(.regularMaterial) // Glassmorphism
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal, 40) // Make it float with some margin
        .padding(.bottom, 10) // Lift it up slightly
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.1).ignoresSafeArea()
        VStack {
            Spacer()
            CustomTabBar(selectedTab: .constant(0))
        }
    }
}

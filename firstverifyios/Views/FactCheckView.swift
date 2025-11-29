//
//  FactCheckView.swift
//  firstverifyios
//
//  AI fact-checking interface with chat-like input
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    let timestamp: Date
}

struct FactCheckView: View {
    @State private var messageText = ""
    @State private var messages: [Message] = [
        Message(
            text: "Hello! How can I help you today?",
            isUser: false,
            timestamp: Date()
        )
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Messages area
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(messages) { message in
                                MessageBubble(message: message)
                                    .id(message.id)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 24)
                    }
                    .background(Color.fvBackground.ignoresSafeArea())
                    .onChange(of: messages.count) { _, _ in
                        if let lastMessage = messages.last {
                            withAnimation(.easeOut(duration: 0.3)) {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }

                // Input area
                VStack(spacing: 0) {
                    Divider()
                        .background(Color.fvTextTertiary.opacity(0.2))

                    HStack(spacing: 12) {
                        TextField("Ask anything...", text: $messageText)
                            .font(.generalSans(16))
                            .textFieldStyle(.plain)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color.fvBackground)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(Color.fvTextTertiary.opacity(0.1), lineWidth: 1)
                            )

                        Button(action: sendMessage) {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(messageText.isEmpty ? .fvTextTertiary.opacity(0.5) : .fvPrimary)
                        }
                        .disabled(messageText.isEmpty)
                        .animation(.easeInOut(duration: 0.2), value: messageText.isEmpty)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.fvCard)
                }
            }
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

    private func sendMessage() {
        guard !messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }

        let userMessage = Message(
            text: messageText,
            isUser: true,
            timestamp: Date()
        )
        messages.append(userMessage)

        let query = messageText
        messageText = ""

        // Simulate AI response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let aiResponse = Message(
                text: "I notice you've just entered \"\(query)\" - could you please provide a complete question or topic you'd like me to help you with? I'm here to assist with any questions or information you need.",
                isUser: false,
                timestamp: Date()
            )
            messages.append(aiResponse)
        }
    }
}

struct MessageBubble: View {
    let message: Message

    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            if message.isUser {
                Spacer(minLength: 60)
            }

            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {
                Text(message.text)
                    .font(.generalSans(16, weight: .regular))
                    .foregroundColor(message.isUser ? .white : .fvHeading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(message.isUser ? Color.fvPrimary : Color.fvCard)
                    .clipShape(RoundedRectangle(cornerRadius: 12)) // Rectangular with slight rounding
                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
            }
            .frame(maxWidth: 280, alignment: message.isUser ? .trailing : .leading)

            if !message.isUser {
                Spacer(minLength: 60)
            }
        }
    }
}

#Preview {
    FactCheckView()
}

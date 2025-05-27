//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Erik Sebastian de Erice Jerez on 27/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            ChatBubble(text: "Knock, knock!", color: .yellow)
            ChatBubble(text: "Who's there?", color: .teal)
            ChatBubble(text: "Joe", color: .yellow)
            ChatBubble(text: "Joe who?", color: .teal)
            ChatBubble(text: "Joe mama", color: .yellow)
        }
        .padding()
    }
}

struct ChatBubble: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .padding()
            .background(color, in: .rect(cornerRadius: 8))
            .shadow(radius: 8)
    }
}

#Preview {
    ContentView()
}

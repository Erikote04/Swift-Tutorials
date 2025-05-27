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
            Text("Knock, knock!")
                .padding()
                .background(.yellow, in: .rect(cornerRadius: 8))
                .shadow(radius: 8)
            
            Text("Who's there?")
                .padding()
                .background(.teal, in: .rect(cornerRadius: 8))
                .shadow(radius: 8)
            
            Text("Joe")
                .padding()
                .background(.yellow, in: .rect(cornerRadius: 8))
                .shadow(radius: 8)
            
            Text("Joe who?")
                .padding()
                .background(.teal, in: .rect(cornerRadius: 8))
                .shadow(radius: 8)
            
            Text("Joe mama")
                .padding()
                .background(.yellow, in: .rect(cornerRadius: 8))
                .shadow(radius: 8)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

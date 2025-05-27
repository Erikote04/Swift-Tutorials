//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Erik Sebastian de Erice Jerez on 27/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Knock, knock!")
                .padding()
                .background(.yellow, in: .rect(cornerRadius: 8))
            
            Text("Who's there?")
                .padding()
                .background(.teal, in: .rect(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

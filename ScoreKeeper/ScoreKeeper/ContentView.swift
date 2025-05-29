//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Erik Sebastian de Erice Jerez on 29/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [String] = ["Elisha", "Andre", "Jasmine"]
    
    var body: some View {
        VStack {
            ForEach(0..<players.count, id: \.description) { index in
                TextField("Name", text: $players[index])
            }
            
            Button("Add player", systemImage: "plus") {
                players.append("")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

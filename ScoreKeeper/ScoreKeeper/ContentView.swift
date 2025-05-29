//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Erik Sebastian de Erice Jerez on 29/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = ScoreBoard()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title.bold())
                .padding(.bottom)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        
                        Text("\(player.score)")
                        
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  SeaCreatures
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    private var seaCreatures = [
        SeaCreature(name: "Clam", modelName: "ClamScene"),
        SeaCreature(name: "Fish", modelName: "FishScene"),
        SeaCreature(name: "Slug", modelName: "SlugScene"),
        SeaCreature(name: "Starfish", modelName: "StarfishScene"),
    ]
    
    var body: some View {
        HStack(spacing: 50) {
            Model3D(named: "ClamScene", bundle: realityKitContentBundle)
            Model3D(named: "FishScene", bundle: realityKitContentBundle)
            Model3D(named: "SlugScene", bundle: realityKitContentBundle)
            Model3D(named: "StarfishScene", bundle: realityKitContentBundle)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

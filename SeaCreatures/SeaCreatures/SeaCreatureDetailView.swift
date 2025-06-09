//
//  SeaCreatureDetailView.swift
//  SeaCreatures
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SeaCreatureDetailView: View {
    let modelName: String
    
    var body: some View {
        Model3D(named: modelName, bundle: realityKitContentBundle)
    }
}

#Preview {
    SeaCreatureDetailView(modelName: "SlugScene")
}

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
    
    @State private var verticalRotation: CGFloat = .zero
    @State private var horizontalRotation: CGFloat = .zero
    @State private var endVerticalRotation: CGFloat = .zero
    @State private var endHorizontalRotation: CGFloat = .zero
    
    var body: some View {
        Model3D(named: modelName, bundle: realityKitContentBundle)
            .rotation3DEffect(.degrees(verticalRotation), axis: .x)
            .rotation3DEffect(.degrees(horizontalRotation), axis: .y)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        verticalRotation = value.translation.height + endVerticalRotation
                        horizontalRotation = value.translation.width + endHorizontalRotation
                    }
                    .onEnded { value in
                        endVerticalRotation = verticalRotation
                        endHorizontalRotation = horizontalRotation
                    }
            )
    }
}

#Preview {
    SeaCreatureDetailView(modelName: "SlugScene")
}

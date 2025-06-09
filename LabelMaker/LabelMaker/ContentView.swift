//
//  ContentView.swift
//  LabelMaker
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var label = Label()
    
    var body: some View {
        LabelView(label: $label)
            .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

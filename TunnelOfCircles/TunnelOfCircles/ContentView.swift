//
//  ContentView.swift
//  TunnelOfCircles
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [.cyan, .blue]
    
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Text("Colors")
                    
                    HStack {
                        ColorPicker("Color", selection: $colors[0])
                        ColorPicker("Color", selection: $colors[1])
                        Spacer()
                    }
                    .labelsHidden()
                }
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

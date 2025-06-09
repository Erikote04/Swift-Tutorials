//
//  ContentView.swift
//  TunnelOfCircles
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [.cyan, .blue]
    
    let minDiameter = 50.0
    let diameterChange = 70.0
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<4) { index in
                    Circle()
                        .stroke(lineWidth: 30)
                        .foregroundStyle(colors[index % colors.count])
                        .frame(height: minDiameter + diameterChange * Double(index))
                }
            }
            
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

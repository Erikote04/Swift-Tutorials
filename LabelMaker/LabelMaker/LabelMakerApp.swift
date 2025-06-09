//
//  LabelMakerApp.swift
//  LabelMaker
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI

@main
struct LabelMakerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
        
        WindowGroup(for: Label.self) { $label in
            LabelView(label: $label)
        } defaultValue: {
            Label(text: "", cornerRadius: 20)
        }
        .windowResizability(.contentSize)
        .windowStyle(.plain)
    }
}

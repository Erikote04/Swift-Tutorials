//
//  GratefulMomentsApp.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 16/11/25.
//

import SwiftData
import SwiftUI

@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}

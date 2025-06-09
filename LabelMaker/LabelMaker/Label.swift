//
//  Label.swift
//  LabelMaker
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import Foundation
import SwiftUI

struct Label: Codable, Hashable {
    var id = UUID()
    var text = ""
    var cornerRadius = 20.0
    var colorIndex = 0
    
    static let colors: [Color] = [.cyan, .green, .indigo]
    
    func selectedColor() -> Color {
        Label.colors[colorIndex]
    }
}

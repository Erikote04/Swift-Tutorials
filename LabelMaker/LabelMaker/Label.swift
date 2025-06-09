//
//  Label.swift
//  LabelMaker
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import Foundation

struct Label: Codable, Hashable {
    var id = UUID()
    var text = ""
    var cornerRadius = 20.0
}

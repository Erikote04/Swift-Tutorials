//
//  Terrain.swift
//  TrailAnalyzer
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import Foundation

enum Terrain: String, Identifiable, CaseIterable {
    case dirt
    case paved
    case rocky
    case sandy
    
    var id: String {
        rawValue
    }
}

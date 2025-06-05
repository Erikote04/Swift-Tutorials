//
//  Sentiment.swift
//  HikingSurvey
//
//  Created by Erik Sebastian de Erice Jerez on 5/6/25.
//

import Foundation
import SwiftUI

enum Sentiment {
    case positive
    case negative
    case moderate
    
    init(_ score: Double) {
        if score > 0.2 {
            self = .positive
        } else if score < -0.2 {
            self = .negative
        } else {
            self = .moderate
        }
    }
    
    var icon: String {
        switch self {
        case .positive: "chevron.up"
        case .negative: "chevron.down"
        case .moderate: "minus"
        }
    }
    
    var color: Color {
        switch self {
        case .positive: Color(red: 0.99, green: 0.49, blue: 0.00)
        case .negative: Color(red: 0.08, green: 0.22, blue: 0.41)
        case .moderate: Color(red: 0.00, green: 0.44, blue: 0.49)
        }
    }
}

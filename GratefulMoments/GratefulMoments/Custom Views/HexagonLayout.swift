//
//  HexagonLayout.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 18/11/25.
//

import SwiftUI

enum HexagonLayout {
    case standard
    case large
    
    var size: CGFloat {
        switch self {
        case .standard: return 200.0
        case .large: return 350.0
        }
    }
    
    var titleFont: Font {
        switch self {
        case .standard: return .headline
        case .large: return .title.bold()
        }
    }
    
    var bodyFont: Font {
        switch self {
        case .standard: return .caption2
        case .large: return .body
        }
    }
    
    var textBottomPadding: CGFloat { 0.25 }
    
    var timestampBottomPadding: CGFloat { 0.08 }
    
    var timestampHeight: CGFloat { size * (textBottomPadding - timestampBottomPadding) }
}

//
//  BoundsRect.swift
//  SignDecoder
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import Foundation
import SwiftUI
import Vision

struct BoundsRect: Shape {
    let normalizedText: NormalizedRect
    
    func path(in rect: CGRect) -> Path {
        let imageCoordinatesRect = normalizedText.toImageCoordinates(rect.size, origin: .upperLeft)
        return Path(imageCoordinatesRect)
    }
}

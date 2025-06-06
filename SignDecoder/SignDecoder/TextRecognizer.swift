//
//  TextRecognizer.swift
//  SignDecoder
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import Foundation
import SwiftUI
import Vision

struct TextRecognizer {
    var recognizedText = ""
    var observations: [RecognizedTextObservation] = []
    
    init(imageResource: ImageResource) async {
        var request = RecognizeTextRequest()
        
        let image = UIImage(resource: imageResource)
        
        if let imageData = image.pngData(),
           let results = try? await request.perform(on: imageData) {
            observations = results
        }
        
        for observation in observations {
            let candidate = observation.topCandidates(1)
        }
    }
}

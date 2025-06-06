//
//  TrailAnalyzer.swift
//  TrailAnalyzer
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import Foundation
import CoreML

struct TrailAnalyzer {
    func predictRisk() -> Risk {
        do {
            let model = try TrailAnalyzerModel(configuration: MLModelConfiguration())
            
            let input = TrailAnalyzerModelInput(distance: 1,
                                                elevation: 0,
                                                terrain: "paved",
                                                dangerous: 0)
            let predictedRisk = try model.prediction(input: input).risk
            
            switch predictedRisk {
            case 0..<20: return .easy
            case 20..<50: return .moderate
            case 50..<100: return .difficult
            default: return .highRisk
            }
        } catch {
            return .highRisk
        }
    }
}

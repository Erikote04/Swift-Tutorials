//
//  PredictionView.swift
//  TrailAnalyzer
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import SwiftUI

struct PredictionView: View {
    @State var predictedRisk: Risk
    
    var body: some View {
        VStack {
            RiskCard(risk: predictedRisk)
            Spacer()
        }
        .navigationTitle("Results")
        .navigationBarTitleDisplayMode(.large)
        .trailTheme()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    riskSummaryView
                } label: {
                    Image(systemName: "info.circle")
                }
            }
        }
    }
    
    var riskSummaryView: some View {
        ScrollView {
            ForEach(Risk.allCases) {
                RiskCard(risk: $0)
            }
        }
        .trailTheme()
    }
}

#Preview {
    NavigationStack {
        PredictionView(predictedRisk: .moderate)
    }
}

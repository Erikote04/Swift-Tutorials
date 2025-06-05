//
//  ChartView.swift
//  HikingSurvey
//
//  Created by Erik Sebastian de Erice Jerez on 5/6/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    var responses: [Response]
    
    init(responses: [Response]) {
        self.responses = responses.sorted { $0.score < $1.score }
    }
    
    var body: some View {
        Chart(responses) { response in
            SectorMark(angle: .value("Type", 1))
                .foregroundStyle(by: .value("sentiment", response.sentiment))
        }
        .chartForegroundStyleScale([
            Sentiment.positive : Sentiment.positive.color,
            Sentiment.negative : Sentiment.negative.color,
            Sentiment.moderate : Sentiment.moderate.color
        ])
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 200)
        .padding()
    }
}

#Preview {
    ContentView()
}

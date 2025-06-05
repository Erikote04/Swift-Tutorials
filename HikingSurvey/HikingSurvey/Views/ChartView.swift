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
            SectorMark(angle: .value("Type", 1), innerRadius: .ratio(0.75))
                .foregroundStyle(by: .value("sentiment", response.sentiment))
        }
        .chartForegroundStyleScale([
            Sentiment.positive : Sentiment.positive.color,
            Sentiment.negative : Sentiment.negative.color,
            Sentiment.moderate : Sentiment.moderate.color
        ])
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    
                    Image(systemName: "figure.hiking")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: frame.height * 0.4)
                        .foregroundStyle(Color(white: 0.59))
                        .position(x: frame.midX, y: frame.midY)
                }
            }
        }
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 200)
        .padding()
    }
}

#Preview {
    ContentView()
}

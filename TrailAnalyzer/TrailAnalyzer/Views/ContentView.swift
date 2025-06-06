//
//  ContentView.swift
//  TrailAnalyzer
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var trailInfo = TrailInfo()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Enter the data about your upcoming hike")
                    .font(.subheadline.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                TrailInfoView(trailInfo: $trailInfo)
                
                NavigationLink {
                    let analyzer = TrailAnalyzer()
                    let risk = analyzer.predictRisk(trailInfo: trailInfo)
                    PredictionView(predictedRisk: risk)
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.tint, in: .rect(cornerRadius: 12))
                        .foregroundStyle(.white)
                }
            }
            .navigationTitle("Trail Analyzer")
            .scrollDismissesKeyboard(.interactively)
            .trailTheme()
        }
        .tint(.trailTheme)
        .onAppear {
            trailInfo = .sample
        }
    }
}

#Preview {
    ContentView()
}

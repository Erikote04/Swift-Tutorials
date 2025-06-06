//
//  TrailInfoView.swift
//  TrailAnalyzer
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import SwiftUI

struct TrailInfoView: View {
    @Binding var trailInfo: TrailInfo
    
    var body: some View {
        VStack {
            Text("Distance")
            TextField("kilometers", value: $trailInfo.distance, format: .number)
                .keyboardType(.numberPad)
            
            Text("Elevation")
            TextField("meters", value: $trailInfo.elevation, format: .number)
                .keyboardType(.numberPad)
            
            Text("Terrain")
            Picker("Terrain", selection: $trailInfo.terrain) {
                ForEach(Terrain.allCases, id: \.self) { terrain in
                    Text(terrain.rawValue.capitalized).tag(terrain)
                }
            }
            .tint(.black)
            
            Text("Danger from wildlife")
            Picker("Danger from wildlife", selection: $trailInfo.wildlifeDangerLevel) {
                Text("Low").tag(TrailInfo.lowDanger)
                Text("High").tag(TrailInfo.highDanger)
            }
            .frame(width: 110)
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    @Previewable @State var trailInfo = TrailInfo.empty
    TrailInfoView(trailInfo: $trailInfo)
}

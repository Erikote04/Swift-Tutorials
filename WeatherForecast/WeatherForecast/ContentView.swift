//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Erik Sebastian de Erice Jerez on 27/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast()
            DayForecast()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    var body: some View {
        VStack {
            Text("Mon")
            
            Image(systemName: "sun.max.fill")
                .foregroundStyle(Color.yellow)
            
            Text("High: 70")
            
            Text("Low: 50")
        }
        .padding()
    }
}

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
            DayForecast(day: "Mon", high: 70, low: 50)
            DayForecast(day: "Tue", high: 60, low: 40)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    
    var body: some View {
        VStack {
            Text(day)
            
            Image(systemName: "sun.max.fill")
                .foregroundStyle(Color.yellow)
            
            Text("High: \(high)º")
            
            Text("Low: \(low)º")
        }
        .padding()
    }
}

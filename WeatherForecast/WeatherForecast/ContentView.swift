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
            DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
            DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        return isRainy ? "cloud.rain.fill" : "sun.max.fill"
    }
    
    var iconColor: Color {
        return isRainy ? .blue : .yellow
    }
    
    var body: some View {
        VStack {
            Text(day)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            
            Text("High: \(high)º")
            
            Text("Low: \(low)º")
        }
        .padding()
    }
}

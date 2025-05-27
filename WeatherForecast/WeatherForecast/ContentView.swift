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
            DayForecast(day: "Mon")
            DayForecast(day: "Tue")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    
    var body: some View {
        VStack {
            Text(day)
            
            Image(systemName: "sun.max.fill")
                .foregroundStyle(Color.yellow)
            
            Text("High: 70")
            
            Text("Low: 50")
        }
        .padding()
    }
}

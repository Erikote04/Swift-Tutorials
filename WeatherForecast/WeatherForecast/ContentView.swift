//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Erik Sebastian de Erice Jerez on 27/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        DayForecast(day: "Mon", isRainy: true, high: 60, low: 40)
                        DayForecast(day: "Tues", isRainy: false, high: 80, low: 60)
                        DayForecast(day: "Wed", isRainy: false, high: 70, low: 50)
                        DayForecast(day: "Thurs", isRainy: true, high: 60, low: 40)
                        DayForecast(day: "Fri", isRainy: true, high: 50, low: 30)
                        DayForecast(day: "Sat", isRainy: false, high: 60, low: 40)
                        DayForecast(day: "Sun", isRainy: false, high: 70, low: 50)
                    }
                }
                
                WeekForecast()
                
                Spacer()
            }
            .padding()
        }
        .background(.blue.gradient, ignoresSafeAreaEdges: .all)
    }
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
                .font(.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(4)
            
            Text("High: \(high)º")
                .font(.callout)
                .fontWeight(.medium)
            
            Text("Low: \(low)º")
                .font(.callout)
                .fontWeight(.medium)
        }
        .padding()
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
    }
}

struct WeekForecast: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Week Forecast")
                .font(.title)
            
            Text("May 26th - June 1st")
                .font(.caption)
            
            HStack(spacing: 8) {
                VStack(alignment: .leading) {
                    Text("Average high: 65º")
                    Text("Average low: 45º")
                }
                
                VStack(alignment: .leading) {
                    Text("Sunny days: 4")
                    Text("Rainy days: 3")
                }
            }
            .padding(.vertical, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
    }
}

#Preview {
    ContentView()
}

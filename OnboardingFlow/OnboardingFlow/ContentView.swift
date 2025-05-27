//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by Erik Sebastian de Erice Jerez on 27/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}

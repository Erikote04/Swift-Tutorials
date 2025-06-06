//
//  TrailTheme.swift
//  TrailAnalyzer
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import SwiftUI

struct TrailTheme: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            VStack {
                Image(.background)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            content
                .padding(.horizontal)
        }
        .background(Color(white: 0.94))
    }
}

extension View {
    public func trailTheme() -> some View {
        modifier(TrailTheme())
    }
}

#Preview {
    Text("Hello, World!")
        .trailTheme()
}

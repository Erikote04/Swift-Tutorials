//
//  StreakView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 19/11/25.
//

import SwiftUI

struct StreakView: View {
    var numberOfDays: Int
    
    var body: some View {
        Hexagon(borderColor: .secondary) {
            VStack(spacing: .zero) {
                Text("Streak \(Image(systemName: "flame.fill"))")
                    .foregroundStyle(.ember)
                
                Text(attributedText)
                    .multilineTextAlignment(.center)
            }
            .font(.callout)
        }
    }
    
    var attributedText: AttributedString {
        var attributedString = AttributedString(localized: "^[\(numberOfDays) \nDays](inflect: true)")
        
        if let range = attributedString.range(of: "\(numberOfDays)") {
            attributedString[range].font = .system(size: 70)
        }
        
        return attributedString
    }
}

#Preview {
    StreakView(numberOfDays: 0)
    StreakView(numberOfDays: 1)
    StreakView(numberOfDays: 2)
}

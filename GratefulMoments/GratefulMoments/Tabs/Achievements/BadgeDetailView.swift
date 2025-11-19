//
//  BadgeDetailView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 19/11/25.
//

import SwiftUI

struct BadgeDetailView: View {
    var badge: Badge
    
    var body: some View {
        VStack(spacing: 8) {
            Image(badge.details.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            
            Text(badge.details.title)
                .font(.title.bold())
            
            Text(badge.details.congratulatoryMessage)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .frame(width: 320, height: 410)
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
        .background(badge.details.color)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    BadgeDetailView(badge: .sample)
}

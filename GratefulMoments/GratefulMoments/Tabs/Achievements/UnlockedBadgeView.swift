//
//  BadgeDetailView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 19/11/25.
//

import SwiftUI

struct UnlockedBadgeView: View {
    var badge: Badge
    
    var body: some View {
        NavigationLink {
            BadgeDetailView(badge: badge)
        } label: {
            VStack(spacing: 8) {
                Image(badge.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                
                Text(badge.details.title)
                    .font(.headline.bold())
                
                Text(badge.details.requirements)
                    .font(.caption2.bold())
                
                Spacer()
                
                if let timestamp = badge.timestamp {
                    Text(timestamp, style: .date)
                        .font(.caption2.bold())
                }
            }
            .padding()
            .frame(width: 210)
            .frame(minHeight: 225)
            .fixedSize()
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .background(badge.details.color)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    NavigationStack {
        UnlockedBadgeView(badge: .sample)
    }
}

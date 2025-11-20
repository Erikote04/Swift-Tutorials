//
//  HexagonAccessoryView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 19/11/25.
//

import SwiftUI

struct HexagonAccessoryView: View {
    let moment: Moment
    let layout: HexagonLayout
    
    var body: some View {
        NavigationLink {
            if badges.count == 1 {
                BadgeDetailView(badge: badges[0])
            } else {
                MomentDetailView(moment: moment)
            }
        } label: {
            badgeView
        }
    }
    private var badgeView: some View {
        Group {
            if badges.count > 1 {
                Text("+\(badges.count)")
                    .bold()
                    .minimumScaleFactor(0.3)
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding(8)
                    .background {
                        Image("Blank")
                            .resizable()
                            .frame(width: size, height: size)
                            .shadow(radius: 2)
                    }
            } else if let badge = badges.first {
                Image(badge.details.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .shadow(radius: 2)
            }
        }
        .offset(y: yOffset)
    }
    
    private var badges: [Badge] {
        moment.badges
    }
    
    private var size: CGFloat {
        layout.size / 5
    }
    
    private var yOffset: CGFloat {
        let radius = layout.size / 2
        // 30 degrees points to the top right corner of a hexagon
        let yOffsetFromHexagonCenter = sin(Angle.degrees(30).radians) * radius
        return radius - yOffsetFromHexagonCenter - (size / 2)
    }
}

#Preview("Single Badge") {
    MomentHexagonView(moment: .sample, layout: .large)
        .sampleDataContainer()
}

#Preview("Multiple Badges") {
    MomentHexagonView(moment: .imageSample, layout: .large)
        .sampleDataContainer()
}

//
//  MomentHexagonView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 18/11/25.
//

import SwiftUI

struct MomentHexagonView: View {
    var moment: Moment
    
    @State var layout: HexagonLayout = .standard
    
    @Environment(\.locale) private var locale
    
    var body: some View {
        Hexagon(moment: moment, layout: layout) {
            hexagonContent()
        }
    }
    
    private func hexagonContent() -> some View {
        ZStack(alignment: .bottom) {
            if isShowingImage {
                Color.clear
                
                contentStack()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                    .background(.ultraThinMaterial)
            } else {
                Color.ember
                
                contentStack()
                    .frame(height: layout.size * 0.8)
            }
            
            Text(moment.timestamp.formatted(
                .dateTime.locale(locale)
                .month(.abbreviated).day()
            ))
            .font(.footnote)
            .padding(.bottom, layout.size * 0.08)
            .frame(maxWidth: layout.size / 3)
            .frame(maxHeight: layout.timestampHeight)
        }
        .foregroundStyle(.white)
    }
    
    private func contentStack() -> some View {
        VStack(alignment: .leading) {
            Text(moment.title)
                .font(layout.titleFont)
            
            if !moment.note.isEmpty, !isShowingImage {
                Text(moment.note)
                    .font(layout.bodyFont)
            }
        }
        .frame(maxWidth: layout.size * 0.80)
        .frame(maxHeight: layout.size * (isShowingImage ? 0.15 : 0.50))
        .padding(.bottom, layout.size * layout.textBottomPadding)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var isShowingImage: Bool {
        moment.image != nil
    }
}

#Preview {
    ScrollView {
        MomentHexagonView(moment: Moment.imageSample)
        MomentHexagonView(moment: Moment.imageSample, layout: .large)
        MomentHexagonView(moment: Moment.sample)
        MomentHexagonView(moment: Moment.sample, layout: .large)
    }
}

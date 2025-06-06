//
//  TrailTheme.swift
//  SignDecoder
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import Foundation
import SwiftUI

struct TrailTheme: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            VStack {
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(maxHeight: 250, alignment: .top)
                
                Spacer()
            }
            
            content
        }
    }
}

extension View {
    func trailTheme() -> some View {
        modifier(TrailTheme())
    }
}

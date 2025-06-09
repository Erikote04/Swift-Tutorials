//
//  ColorButton.swift
//  LabelMaker
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI

struct ColorButton: View {
    @State var color: Color
    var selectColor: (() -> Void)
    
    var body: some View {
        Button {
            selectColor()
        } label: {
            Circle()
                .foregroundStyle(color)
                .frame(height: 34)
        }
        .buttonBorderShape(.circle)
    }
}

#Preview {
    ColorButton(color: .cyan) {
        
    }
}

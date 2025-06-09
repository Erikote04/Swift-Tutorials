//
//  LabelView.swift
//  LabelMaker
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI

struct LabelView: View {
    @Environment(\.isEnabled) private var isEnabled
    @Binding var label: Label
    
    var body: some View {
        TextField("Type to enter text", text: $label.text, axis: .vertical)
            .frame(width: 500, height: isEnabled ? 500 : nil)
            .padding(50)
            .background(label.selectedColor(), in: .rect(cornerRadius: label.cornerRadius))
            .foregroundStyle(.black)
            .font(.system(size: 40, weight: .semibold))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    @Previewable @State var label = Label(text: "The label's text content")
    LabelView(label: $label)
        .disabled(true)
}

//
//  LabelView.swift
//  LabelMaker
//
//  Created by Erik Sebastian de Erice Jerez on 9/6/25.
//

import SwiftUI

struct LabelView: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Type to enter text", text: $text, axis: .vertical)
            .frame(width: 500, height: 500)
            .padding()
            .background(.blue, in: .rect(cornerRadius: 20))
            .foregroundStyle(.black)
            .font(.system(size: 40, weight: .semibold))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    LabelView()
}

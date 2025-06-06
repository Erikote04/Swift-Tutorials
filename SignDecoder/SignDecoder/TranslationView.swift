//
//  TranslationView.swift
//  SignDecoder
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import SwiftUI
import Translation

struct TranslationView: View {
    var text: String
    var isProcessing: Bool
    @State private var showingTranslation = false
    
    var body: some View {
        VStack {
            Text("Identified Text")
                .font(.subheadline.bold())
                .textCase(.uppercase)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .topLeading)
                .padding()
                .background(Color(white: 0.9))
                .overlay {
                    if isProcessing {
                        ProgressView()
                    }
                }
                .translationPresentation(isPresented: $showingTranslation, text: text)
            
            Button {
                showingTranslation = true
            } label: {
                Text("Translate")
            }
        }
    }
}

#Preview {
    TranslationView(text: "Caution, falling rocks", isProcessing: false)
}

#Preview("Loading") {
    TranslationView(text: "", isProcessing: true)
}

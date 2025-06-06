//
//  TextRecognitionView.swift
//  SignDecoder
//
//  Created by Erik Sebastian de Erice Jerez on 6/6/25.
//

import SwiftUI

struct TextRecognitionView: View {
    let imageResource: ImageResource
    let boundingColor = Color(red: 1.00, green: 0.00, blue: 0.85)
    @State private var textRecognizer: TextRecognizer?
    
    private var isProcessing: Bool {
        textRecognizer == nil
    }
    
    var body: some View {
        VStack {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(cornerRadius: 8))
                .task {
                    textRecognizer = await TextRecognizer(imageResource: imageResource)
                }
                .overlay {
                    if let observations = textRecognizer?.observations {
                        ForEach(observations, id: \.self) { observation in
                            BoundsRect(normalizedText: observation.boundingBox)
                                .stroke(boundingColor, lineWidth: 3)
                        }
                    }
                }
            
            Spacer()
            
            TranslationView(text: textRecognizer?.recognizedText ?? "", isProcessing: isProcessing)
        }
        .padding()
        .navigationTitle("Sign Info")
    }
}

#Preview {
    NavigationStack {
        TextRecognitionView(imageResource: .sign1)
            .navigationBarTitleDisplayMode(.inline)
    }
}

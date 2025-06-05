//
//  ResponseView.swift
//  HikingSurvey
//
//  Created by Erik Sebastian de Erice Jerez on 5/6/25.
//

import SwiftUI

struct ResponseView: View {
    var response: Response
    
    var body: some View {
        Text(response.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
    }
}

#Preview {
    ResponseView(response: Response(text: "I enjoy hiking very much"))
}

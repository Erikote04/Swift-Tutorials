//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Erik Sebastian de Erice Jerez on 27/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Elisa", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            
            TextField("Add name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

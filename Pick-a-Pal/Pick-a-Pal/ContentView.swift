//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Erik Sebastian de Erice Jerez on 27/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    @State private var savedNames: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 8) {
                    Image(systemName: "person.3.sequence.fill")
                        .foregroundStyle(.tint)
                        .symbolRenderingMode(.hierarchical)
                    
                    Text("Pick-a-Pal")
                }
                .font(.title.bold())
                
                Text(pickedName.isEmpty ? " " : pickedName)
                    .font(.title2.bold())
                    .foregroundStyle(.tint)
                
                List {
                    ForEach(names, id: \.description) { name in
                        Text(name)
                    }
                }
                .listStyle(.plain)
                
                TextField("Add name", text: $nameToAdd)
                    .padding(.vertical)
                    .autocorrectionDisabled()
                    .onSubmit {
                        let trimmedName = nameToAdd.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        if !trimmedName.isEmpty && !names.contains(trimmedName) {
                            names.append(trimmedName)
                        }
                        
                        nameToAdd = ""
                    }
                
                Divider()
                
                Toggle("Remove when picked", isOn: $shouldRemovePickedName)
                    .padding(.vertical)
                    .tint(.accentColor)
                
                Divider()
                
                Button {
                    if let randomName = names.randomElement() {
                        pickedName = randomName
                        
                        if shouldRemovePickedName {
                            names.removeAll { $0 == pickedName }
                        }
                    } else {
                        pickedName = ""
                    }
                } label: {
                    Text("Pick Random Name")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                }
                .padding(.vertical)
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        savedNames = names
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Load") {
                        names = savedNames
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

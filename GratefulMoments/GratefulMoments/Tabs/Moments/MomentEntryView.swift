//
//  MomentEntryView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 16/11/25.
//

import PhotosUI
import SwiftData
import SwiftUI

struct MomentEntryView: View {
    @State private var title = ""
    @State private var note = ""
    @State private var imageData: Data?
    @State private var image: PhotosPickerItem?
    @State private var isShowingCancelConfirmation = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(DataContainer.self) private var dataContainer
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Grateful For")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("cancel", systemImage: "xmark") {
                        if title.isEmpty, note.isEmpty, imageData == nil {
                            dismiss()
                        } else {
                            isShowingCancelConfirmation = true
                        }
                    }
                    .confirmationDialog("Discard Moment", isPresented: $isShowingCancelConfirmation) {
                        Button("Discard Moment", role: .destructive) {
                            dismiss()
                        }
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add", systemImage: "checkmark") {
                        let moment = Moment(
                            title: title,
                            note: note,
                            imageData: imageData,
                            timestamp: .now
                        )
                        
                        dataContainer.context.insert(moment)
                        
                        do {
                            try dataContainer.context.save()
                            dismiss()
                        } catch {
                            // Don't dismiss
                        }
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
    
    var contentStack: some View {
        VStack(alignment: .leading) {
            TextField(text: $title) {
                Text("Title (Required)")
            }
            .font(.title.bold())
            .padding(.top, 48)
            
            Divider()
            
            TextField("Log your small wins", text: $note, axis: .vertical)
                .multilineTextAlignment(.leading)
                .lineLimit(5...Int.max)
            
            photoPicker
        }
        .padding()
    }
    
    private var photoPicker: some View {
        PhotosPicker(selection: $image) {
            Group {
                if let imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "photo.badge.plus.fill")
                        .font(.largeTitle)
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .background(Color(white: 0.4, opacity: 0.32))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onChange(of: image) {
            guard let image else { return }
            
            Task {
                imageData = try await image.loadTransferable(type: Data.self)
            }
        }
    }
}

#Preview {
    MomentEntryView()
        .sampleDataContainer()
}

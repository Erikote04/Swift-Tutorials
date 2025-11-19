//
//  MomentDetailView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 18/11/25.
//

import SwiftData
import SwiftUI

struct MomentDetailView: View {
    var moment: Moment
    
    @State private var isShowingConfirmation = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(DataContainer.self) private var dataContainer
    
    var body: some View {
        ScrollView {
            contentStack
        }
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button {
                    isShowingConfirmation = true
                } label: {
                    Image(systemName: "trash")
                }
                .confirmationDialog("Delete Moment", isPresented: $isShowingConfirmation) {
                    Button("Delete Moment", role: .destructive) {
                        dataContainer.context.delete(moment)
                        try? dataContainer.context.save()
                        dismiss()
                    }
                } message: {
                    Text("The moment will be permanently deleted. Earned badges won't be removed")
                }

            }
        }
        .navigationTitle(moment.title)
        .navigationSubtitle(Text(moment.timestamp, style: .date))
    }
    
    private var contentStack: some View {
        VStack(alignment: .leading) {
            if !moment.note.isEmpty {
                Text(moment.note)
                    .textSelection(.enabled)
            }
            
            if let image = moment.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    NavigationStack {
        MomentDetailView(moment: .imageSample)
            .sampleDataContainer()
    }
}

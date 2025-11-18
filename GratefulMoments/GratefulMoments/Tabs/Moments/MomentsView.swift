//
//  MomentsView.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 18/11/25.
//

import SwiftData
import SwiftUI

struct MomentsView: View {
    @State private var isShowingCreateMoment = false
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                pathItems
                    .frame(maxWidth: .infinity)
            }
            .overlay {
                if moments.isEmpty {
                    ContentUnavailableView {
                        Label("No moments yet!", systemImage: "exclamationmark.circle.fill")
                    } description: {
                        Text("Post a note or photo to start filling this space with gratitude.")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingCreateMoment = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isShowingCreateMoment) {
                        MomentEntryView()
                    }
                }
            }
            .navigationTitle("Grateful Moments")
        }
    }
    
    private var pathItems: some View {
        ForEach(moments) { moment in
            Text(moment.title)
        }
    }
}

#Preview {
    MomentsView()
        .sampleDataContainer()
}

#Preview("No moments") {
    MomentsView()
        .modelContainer(for: [Moment.self])
}

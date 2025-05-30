//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Erik Sebastian de Erice Jerez on 30/5/25.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name) {
                        Text("Detail view for \(friend.name)")
                            .navigationTitle("Friend")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Friends")
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

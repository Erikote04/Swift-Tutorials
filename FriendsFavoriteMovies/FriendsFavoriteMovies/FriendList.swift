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
        List {
            ForEach(friends) { friend in
                Text(friend.name)
            }
        }
        .task {
            context.insert(Friend(name: "Elena"))
            context.insert(Friend(name: "Rody"))
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(for: Friend.self, inMemory: true)
}

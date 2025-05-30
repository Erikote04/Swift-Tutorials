//
//  ContentView.swift
//  Birthdays
//
//  Created by Erik Sebastian de Erice Jerez on 30/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Elton Lin", birthday: .now),
        Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
        }
    }
}

#Preview {
    ContentView()
}

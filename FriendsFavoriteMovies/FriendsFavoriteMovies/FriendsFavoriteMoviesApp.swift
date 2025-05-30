//
//  FriendsFavoriteMoviesApp.swift
//  FriendsFavoriteMovies
//
//  Created by Erik Sebastian de Erice Jerez on 30/5/25.
//

import SwiftUI

@main
struct FriendsFavoriteMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Friend.self, Movie.self])
    }
}

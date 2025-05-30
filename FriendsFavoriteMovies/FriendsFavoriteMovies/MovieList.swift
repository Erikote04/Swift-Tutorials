//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Erik Sebastian de Erice Jerez on 30/5/25.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        MovieDetail(movie: movie)
                    }
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}

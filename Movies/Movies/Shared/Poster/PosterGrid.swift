//
//  PosterGrid.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct PosterGrid: View {
    let title: String
    let movies: [Movie]
    let columns = Grid.poster.columns
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(movies) { movie in
                    NavigationLink(destination: MovieDetail(movieId: movie.id)) {
                        Poster(movie: movie)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle(title)
    }
}

struct PosterGrid_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PosterGrid(title: "Popular", movies: Movie.stubbedMovies)
                .previewDevice("iPhone 12")
            PosterGrid(title: "Popular", movies: Movie.stubbedMovies)
                .previewDevice("iPad Air (4th generation)")
        }
    }
}

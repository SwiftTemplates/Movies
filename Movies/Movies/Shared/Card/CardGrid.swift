//
//  CardGrid.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct CardGrid: View {
    let title: String
    let movies: [Movie]
    
    let columns = Grid.cover.columns
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(movies) { movie in
                    NavigationLink(destination: MovieDetail(movieId: movie.id)) {
                        Card(movie: movie)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle(title)
    }
}

struct CardGrid_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardGrid(title: "Popular", movies: Movie.stubbedMovies)
                .previewDevice("iPhone 12")
            CardGrid(title: "Popular", movies: Movie.stubbedMovies)
                .previewDevice("iPad Air (4th generation)")
        }
    }
}

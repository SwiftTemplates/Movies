//
//  FeaturedRow.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct FeaturedRow: View {
    let movies: [Movie]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            PageView(indexDisplayMode: .never, indexBackgroundDisplayMode: .never) {
                
                NavigationLink(destination: MovieDetail(movieId: movies[0].id)) {
                    Featured(movie: movies[0])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[1].id)) {
                    Featured(movie: movies[1])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[2].id)) {
                    Featured(movie: movies[2])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[3].id)) {
                    Featured(movie: movies[3])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[4].id)) {
                    Featured(movie: movies[4])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[5].id)) {
                    Featured(movie: movies[5])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[6].id)) {
                    Featured(movie: movies[6])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[7].id)) {
                    Featured(movie: movies[7])
                }
                
                NavigationLink(destination: MovieDetail(movieId: movies[8].id)) {
                    Featured(movie: movies[8])
                }
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
}

struct FeaturedRow_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedRow(movies: Movie.stubbedMovies)
    }
}

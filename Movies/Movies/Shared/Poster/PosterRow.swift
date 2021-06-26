//
//  PosterRow.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct PosterRow: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(title)
                    .font(.system(size: 21))
                    .fontWeight(.bold)
                
                NavigationLink(destination: PosterGrid(title: title, movies: movies)) {
                    
                    Spacer()
                    
                    Text("See More")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, -10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetail(movieId: movie.id)) {
                            Poster(movie: movie)
                        }
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
            }
        }
    }
}

struct PosterRow_Previews: PreviewProvider {
    static var previews: some View {
        PosterRow(title: "Now Playing", movies: Movie.stubbedMovies)
    }
}

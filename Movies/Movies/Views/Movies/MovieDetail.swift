//
//  MovieDetail.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct MovieDetail: View {
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
            if movieDetailState.movie != nil {
                //MovieDetailList(movie: self.movieDetailState.movie!)
                MovieDetailParallax(movie: self.movieDetailState.movie!)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        //.navigationBarTitle(movieDetailState.movie?.title ?? "", displayMode: .inline)
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MovieDetailList: View {
    let movie: Movie
    let imageLoader = ImageLoader()
    @State private var selectedTrailer: MovieVideo?
    
    var body: some View {
        List {
            Group {
                MovieCover(movie: movie)
                //MovieCoverPoster(movie: movie)
                    //.edgesIgnoringSafeArea(.top)
                    //.frame(height: 735)
            }
            .listRowInsets(EdgeInsets())
            /*
            Group {
                
            }
            */
        }
        //.edgesIgnoringSafeArea(.top)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movieId: Movie.stubbedMovie.id)
    }
}


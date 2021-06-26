//
//  MovieHome.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct MovieHome: View {
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    private func isReady(for state: MovieListState) -> Bool {
        if state.movies != nil { return true }
        else { return false }
      }
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    if isReady(for: popularState) {
                        FeaturedRow(movies: popularState.movies!)
                            //.aspectRatio(16/9, contentMode: .fill)
                            .buttonStyle(PlainButtonStyle())
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                        //.aspectRatio(16/9, contentMode: .fill)
                    }
                }
                .aspectRatio(16/9, contentMode: .fill)
                .listRowInsets(EdgeInsets())
                //.listStyle(InsetListStyle())
                
                // MARK: Now Playing
                Group {
                    if isReady(for: nowPlayingState) {
                        PosterRow(title: "Now Playing", movies: nowPlayingState.movies!)
                            .buttonStyle(PlainButtonStyle())
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                // MARK: Upcoming
                Group {
                    if isReady(for: upcomingState) {
                        CardRow(title: "Upcoming", movies: upcomingState.movies!)
                            .buttonStyle(PlainButtonStyle())
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                // MARK: Top Rated
                Group {
                    if isReady(for: topRatedState) {
                        PosterRow(title: "Top Rated", movies: topRatedState.movies!)
                            .buttonStyle(PlainButtonStyle())
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                // MARK: Popular
                Group {
                    if isReady(for: popularState) {
                        PosterRow(title: "Popular", movies: popularState.movies!)
                            .buttonStyle(PlainButtonStyle())
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            }
            .navigationTitle("Movies")
            .listStyle(InsetListStyle())
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
    }
}

struct MovieHome_Previews: PreviewProvider {
    static var previews: some View {
        MovieHome()
    }
}

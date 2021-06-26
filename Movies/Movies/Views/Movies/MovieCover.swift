//
//  MovieCover.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct MovieCover: View {
    let movie: Movie
    let imageLoader = ImageLoader()
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(1), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                MovieCoverImage(movie: movie, imageLoader: imageLoader, imageURL: self.movie.coverLarge)
                    .overlay(gradient)
                    .overlay(MovieTitle(movie: movie), alignment: .bottom)
                    .aspectRatio(1, contentMode: .fit)
                    
            }
            .aspectRatio(1, contentMode: .fit)
            HStack {
                MovieDetailOverview(movie: movie)
            }
            .padding(.top, -8)
            //MovieTitle(movie: movie)
            //.overlay(MovieTitle(movie: movie), alignment: .bottom)
        }
        
        
        
        /*
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(.black)
                    .overlay(
                        MovieCoverImage(movie: movie, imageLoader: imageLoader, imageURL: self.movie.backdropHDURL)
                            //.overlay(MovieDetailTitleView(movieId: movie.id), alignment: .bottom), alignment: .center)
                            )
            }
            .frame(height: 450)
            
            HStack {
                Rectangle()
                    .foregroundColor(.black)
                    .padding(.top, -8)
                    //.overlay(MovieDetailInfoList(movie: movie))
            }
            .frame(height: 110)
        }
        */
        
    }
}

struct MovieCoverImage: View {
    let movie: Movie
    @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.black)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .layoutPriority(-1)
                    //.aspectRatio(16/9, contentMode: .fill)
                    .overlay(Rectangle()
                                .foregroundColor(.clear)
                                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)), alignment: .bottom)
            }
        }
        .clipped()
        .aspectRatio(1, contentMode: .fit)
        .overlay(MovieTitle(movie: movie), alignment: .bottom)
        //.aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
        //.aspectRatio(16/9, contentMode: .fit)
        //.frame(width: , height: 450)
        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct MovieCover_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieCover(movie: Movie.stubbedMovie)
            MovieCover(movie: Movie.stubbedMovie)
                .previewDevice("iPad Air (4th generation)")
        }
    }
}

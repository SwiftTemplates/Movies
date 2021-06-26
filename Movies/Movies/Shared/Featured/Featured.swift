//
//  Featured.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct Featured: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack {
            FeatureMovieImage(imageLoader: imageLoader, imageURL: movie.coverMedium)
        }
        //.overlay(FeatureMovieTitleOverlay(movie: movie))
    }
}

// Image Cropping & Clipping
// https://stackoverflow.com/a/58292785/1234120
struct FeatureMovieImage: View {
    @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        //.layoutPriority(-1)
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
        }
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}


struct FeatureMovieTitleOverlay: View {
    let movie: Movie
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                    .bold()
                Text(movie.genreText)
            }
            .padding()
            //.padding(.leading, -30)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .foregroundColor(.white)
    }
}

struct Featured_Previews: PreviewProvider {
    static var previews: some View {
        Featured(movie: Movie.stubbedMovie)
    }
}

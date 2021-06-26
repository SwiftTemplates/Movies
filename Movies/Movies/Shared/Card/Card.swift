//
//  Card.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct Card: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.coverSmall)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(movie: Movie.stubbedMovie)
    }
}

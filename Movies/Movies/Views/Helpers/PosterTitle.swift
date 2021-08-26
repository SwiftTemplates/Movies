//
//  PosterTitle.swift
//  PosterTitle
//
//  Created by Justin Bush on 2021-08-26.
//

import SwiftUI

struct PosterTitle: View {
  var movie: Movie
  
  var body: some View {
    VStack(alignment: .leading) {
      Poster(width: 134, height: 201, url: movie.posterURL)
      Text(movie.name)
        .foregroundColor(.primary)
        .font(.caption)
    }
    .padding(.leading, 15)
    .padding(.trailing, 15)
  }
}

struct PosterTitle_Previews: PreviewProvider {
  static var previews: some View {
    PosterTitle(movie: ModelData().movies[0])
  }
}

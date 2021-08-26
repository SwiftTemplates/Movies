//
//  MovieRating.swift
//  MovieRating
//
//  Created by Justin Bush on 2021-08-26.
//

import SwiftUI

struct MovieRating: View {
  var movie: Movie
  
  var body: some View {
    let url = MovieRating.getScoreIcon(movie.rating)
    
    HStack {
      Spacer()
      AsyncImage(url: url) { image in
        image
          .resizable()
          .frame(width: 24, height: 24)
      } placeholder: {
        Color.clear
          .frame(width: 24, height: 24)
      }
      Text("\(movie.rating.description)%")
        .fontWeight(.semibold)
//      image
//        .resizable()
//        .frame(width: 24, height: 24)
//      Text("\(movie.rating.description)%")
//        .fontWeight(.semibold)
    }
  }
  
  static func getScoreIcon(_ score: Int) -> URL {
    if (60...100).contains(score) {
      return URL(string: "\(urlPrefix)/rating/fresh.png")!
    } else if (1...59).contains(score) {
      return URL(string: "\(urlPrefix)/rating/rotten.png")!
    }
    return URL(string: "\(urlPrefix)/rating/unknown.png")!
  }
}

struct MovieRating_Previews: PreviewProvider {
    static var previews: some View {
      MovieRating(movie: ModelData().movies[0])
        .frame(width: 200, height: 80)
    }
}

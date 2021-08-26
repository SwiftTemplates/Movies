//
//  MovieDetail.swift
//  MovieDetail
//
//  Created by Justin Bush on 2021-08-26.
//

import SwiftUI

struct MovieDetail: View {
  @EnvironmentObject var modelData: ModelData
  var movie: Movie
  var movieIndex: Int {
    modelData.movies.firstIndex(where: { $0.id == movie.id })!
  }
  
  var body: some View {
    ScrollView {
      Cover(height: 300, url: movie.coverURL)
        .frame(height: 300)
      
      // MARK: #2 Poster-Title Left
      PosterTitleHorizontal(movie: movie)
        .overlay(
          HStack {
            VStack {
              Text("\(movie.year) • \(movie.genre)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            Spacer()
            MovieRating(movie: movie)
              .font(.subheadline)
              .foregroundColor(.secondary)
              .padding(.bottom, 0)
              .padding(.top, 0)
          }
            .padding(.horizontal, 20).offset(y: -30), alignment: .bottomLeading)
      
      Divider()
        .offset(y: -10)
      
      Text(movie.description)
        .padding()
      
//      // Variant 2: Vertical Poster-Title
//      Poster(width: 150, height: 225, url: movie.posterURL)
//        .offset(y: 130)
//        .padding(.bottom, 130)
//
//      VStack(alignment: .leading) {
//        HStack {
//          Text(movie.name)
//            .font(.title)
//            .fontWeight(.bold)
//        }
//      }
    }
    .ignoresSafeArea(edges: .top)
  }
}

struct MovieDetail_Previews: PreviewProvider {
  static let modelData = ModelData()
  
  static var previews: some View {
    MovieDetail(movie: modelData.movies[1])
      .previewDevice("iPhone 12 Pro")
      .environmentObject(modelData)
  }
}


struct PosterTitleHorizontal: View {
  var movie: Movie
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Poster(width: 150, height: 225, url: movie.posterURL)
        Text(movie.name)
          .font(.title)
          .fontWeight(.bold)
          .offset(x:10,y:60)
          .multilineTextAlignment(.leading)
          .frame(alignment: .bottomLeading)
        Spacer()
      }
      .padding(.horizontal, 20)
    }
    .offset(y:-100)
  }
}

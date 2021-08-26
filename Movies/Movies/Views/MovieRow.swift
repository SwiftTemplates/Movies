//
//  MovieRow.swift
//  MovieRow
//
//  Created by Justin Bush on 2021-08-26.
//

import SwiftUI

struct MovieRow: View {
  var categoryName: String
  var items: [Movie]
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(categoryName)
          .font(.headline)
        
        Spacer()
        
        NavigationLink(destination: MovieGrid(categoryName: categoryName, items: items)) {
          Text("See More")
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }
      .padding(.horizontal).padding(.top)
      .offset(y: 10)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: -15) {
          ForEach(items) { movie in
            NavigationLink(destination: MovieDetail(movie: movie)) {
              PosterTitle(movie: movie)
            }
          }
        }
        .frame(height: 280)
      }
    }
  }
}

struct MovieRow_Previews: PreviewProvider {
  static var movies = ModelData().movies
  static var previews: some View {
    MovieRow(
      categoryName: movies[0].category.rawValue,
      items: Array(movies.prefix(4))
    )
  }
}

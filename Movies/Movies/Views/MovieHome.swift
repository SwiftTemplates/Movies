//
//  MovieHome.swift
//  MovieHome
//
//  Created by Justin Bush on 2021-08-26.
//

import SwiftUI

struct MovieHome: View {
  @EnvironmentObject var modelData: ModelData
  var body: some View {
    let featured = modelData.features[0]
    NavigationView {
      List {
        // Cover
        NavigationLink(destination: MovieDetail(movie: featured)) {
          Cover(height: 300, url: featured.coverURL)
            .frame(height: 300)
        }
        .buttonStyle(.plain)
        .listRowInsets(EdgeInsets())
        // Rows
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          MovieRow(categoryName: key, items: modelData.categories[key]!)
        }
        .listRowInsets(EdgeInsets(top: -0, leading: -20, bottom: 0, trailing: -20))
        .listStyle(.plain)
        .ignoresSafeArea(.all)
        .listRowBackground(Color.clear)
      }
      .navigationTitle("Movies")
    }
    .accentColor(.primary)
  }
}

struct MovieHome_Previews: PreviewProvider {
  static var previews: some View {
    MovieHome()
      .previewDevice("iPhone 12 Pro")
      .environmentObject(ModelData())
  }
}

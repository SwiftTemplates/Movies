//
//  Cover.swift
//  Cover
//
//  Created by Justin Bush on 2021-08-26.
//

import SwiftUI

struct Cover: View {
  var height: CGFloat
  var url: String
  
  var body: some View {
    GeometryReader { geo in
      AsyncImage(url: URL(string: url)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: geo.size.width, height: height, alignment: .center)
      } placeholder: {
        LoadingView(media: .cover, height: height)
          .frame(width: geo.size.width, height: height, alignment: .center)
      }
      .shadow(radius: 5)
    }
    .ignoresSafeArea(edges: .top)
  }
}

struct Cover_Previews: PreviewProvider {
  static let modelData = ModelData()
  static var previews: some View {
    Cover(height: 300, url: modelData.movies[0].coverURL)
  }
}

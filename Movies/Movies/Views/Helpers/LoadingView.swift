//
//  LoadingView.swift
//  LoadingView
//
//  Created by Justin Bush on 2021-08-26.
//

import SwiftUI

struct LoadingView: View {
  var media: MediaType
  var width: CGFloat? = 200
  var height: CGFloat? = 300
  
  var body: some View {
    HStack {
      Label("Loading", systemImage: "clock")
        .foregroundColor(.white)
    }
    .frame(width: width, height: height)
    .frame(maxWidth: .infinity, maxHeight: 300)
    .background(.secondary)
    .clipShape(RoundedRectangle(cornerRadius: media.corners))
  }
}

enum MediaType {
  case poster, cover
  
  var corners: CGFloat {
    switch self {
    case .poster: return 10
    case .cover: return 0
    }
  }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
      LoadingView(media: .poster)
    }
}

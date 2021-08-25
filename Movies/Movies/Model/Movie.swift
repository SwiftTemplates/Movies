//
//  Movie.swift
//  Movies
//
//  Created by Justin Bush on 2021-08-25.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Codable, Identifiable {
  
  var id: Int
  var name: String
  var genre: String
  var year: String
  var rating: Int
  var description: String
  var isFavorite: Bool
  var isFeatured: Bool
  
  private var imageName: String
  var poster: Image {
    Image(imageName)
  }
  var cover: Image {
    Image("\(imageName)-cover")
  }
  
  var category: Category
  enum Category: String, CaseIterable, Codable {
    case recentlyAdded = "Recently Added"
    case topRated = "Top Rated"
    case upcoming = "Upcoming"
  }
  
}

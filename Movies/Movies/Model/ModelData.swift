//
//  ModelData.swift
//  Movies
//
//  Created by Justin Bush on 2021-08-25.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
  @Published var movies: [Movie] = load("movieData.json")
  
  var features: [Movie] {
    movies.filter { $0.isFeatured }
  }
  
  var categories: [String: [Movie]] {
    Dictionary(
      grouping: movies,
      by: { $0.category.rawValue }
    )
  }
}

func load<T: Decodable>(_ filename: String) -> T {
  let data: Data
  
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
  else {
    fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}

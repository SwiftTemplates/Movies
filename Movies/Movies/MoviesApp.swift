//
//  MoviesApp.swift
//  Movies
//
//  Created by Justin Bush on 2021-08-25.
//

import SwiftUI

@main
struct MoviesApp: App {
  @StateObject private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
    }
  }
}

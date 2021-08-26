//
//  ContentView.swift
//  Movies
//
//  Created by Justin Bush on 2021-08-25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    MovieHome()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}

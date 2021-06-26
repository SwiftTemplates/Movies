//
//  Grid.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

enum Grid {
    case poster
    case cover
    
    var columns: [GridItem] {
        switch self {
        case .poster:
            if UIDevice.current.userInterfaceIdiom == .pad {
                return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
            } else {
                return [GridItem(.flexible()), GridItem(.flexible())]
            }
        case .cover:
            if UIDevice.current.userInterfaceIdiom == .pad {
                return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
            } else {
                return [GridItem(.flexible()), GridItem(.flexible())]
            }
        }
    }
}

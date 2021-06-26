//
//  Device.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct Device {
    
    static let phone = UIDevice.current.userInterfaceIdiom == .phone
    static let pad = UIDevice.current.userInterfaceIdiom == .pad
    static let mac = UIDevice.current.userInterfaceIdiom == .mac
    static let tv = UIDevice.current.userInterfaceIdiom == .tv
    
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
    
}

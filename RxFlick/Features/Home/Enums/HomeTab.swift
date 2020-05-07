//
//  HomeTab.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

enum HomeTab: Int {
    case movie
    case tvShows
    case search
    
    var tag: Int {
        return rawValue
    }
    
    var image: UIImage {
        switch self {
        case .movie:
            return UIImage(systemName: "film")!
        case .tvShows:
            return UIImage(systemName: "tv")!
        case .search:
            return UIImage(systemName: "magnifyingglass")!
        }
    }
}

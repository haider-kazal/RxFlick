//
//  TMDbDiscoverRouter.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Alamofire

enum TMDbDiscoverRouter: TMDbRouter {
    case movies
    case tvShows

    var commonPathExtension: String { "/3/discover" }
    
    var path: String {
        switch self {
        case .movies:
            return "/movie"
        case .tvShows:
            return "/tv"
        }
    }
    
    var method: HTTPMethod { .get }
    
    var queries: [String: String]? { nil }
    
    var body: Parameters? { nil }
    
    var headers: HTTPHeaders? { nil }
    
    var bodyEncoder: ParameterEncoding? { URLEncoding.default }
}

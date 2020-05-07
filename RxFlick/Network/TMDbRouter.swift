//
//  TMDbRouter.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Alamofire
import Foundation

protocol TMDbRouter: BaseRouter { }

extension TMDbRouter {
    var baseURL: URL { URL(string: "https://api.themoviedb.org")! }
    
    var fullURL: URL? {
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        urlComponents.path = "\(commonPathExtension)\(path)"
        
        var queryItems = [URLQueryItem(name: "api_key", value: Constants.TMDbConstants.apiKey)]
        
        if let additionalQueries = queries?.map({ URLQueryItem(name: $0, value: $1) }) {
            queryItems.append(contentsOf: additionalQueries)
        }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        return url
    }
}


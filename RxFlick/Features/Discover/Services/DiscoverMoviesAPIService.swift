//
//  DiscoverMoviesAPIService.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation
import RxSwift

final class DiscoverMoviesAPIService {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    private static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func movies(atPage page: Int) -> Observable<PaginatedResults<[TMDbDiscoverMovie]>> {
        let route: TMDbDiscoverRouter = .movies
        
        return Observable.create { (observer) in
            ConnectionManager.request(with: route)
                .responseDecodable(of: PaginatedResults<[TMDbDiscoverMovie]>.self, decoder: DiscoverMoviesAPIService.jsonDecoder) { (response) in
                    switch response.result {
                    case let .success(value):
                        observer.onNext(value)
                        observer.onCompleted()
                        
                    case let .failure(error):
                        observer.onError(error)
                    }
            }
            
            return Disposables.create()
        }
    }
}

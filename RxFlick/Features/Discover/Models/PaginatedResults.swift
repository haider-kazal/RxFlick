//
//  PaginatedResults.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 7/5/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

struct PaginatedResults<ResultType: Codable>: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: ResultType
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}

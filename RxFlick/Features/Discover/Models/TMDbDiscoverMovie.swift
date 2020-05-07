//
//  TMDbDiscoverMovie.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation

struct TMDbDiscoverMovie: Codable {
    let averageVote: Float
    let backdropURL: URL?
    let genreIDs: [Int]
    let id: Int
    let isAdult: Bool
    let isVideo: Bool
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterURL: URL?
    let releaseDate: Date
    let title: String
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case averageVote = "vote_average"
        case backdropURL = "backdrop_path"
        case genreIDs = "genre_ids"
        case id = "id"
        case isAdult = "adult"
        case isVideo = "video"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterURL = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case voteCount = "vote_count"
    }
    
    init(averageVote: Float,
         backdropURL: URL?,
         genreIDs: [Int],
         id: Int,
         isAdult: Bool,
         isVideo: Bool,
         originalLanguage: String,
         originalTitle: String,
         overview: String,
         popularity: Float,
         posterURL: URL?,
         releaseDate: Date,
         title: String,
         voteCount: Int
    ) {
        self.averageVote = averageVote
        self.backdropURL = backdropURL
        self.genreIDs = genreIDs
        self.id = id
        self.isAdult = isAdult
        self.isVideo = isVideo
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterURL = posterURL
        self.releaseDate = releaseDate
        self.title = title
        self.voteCount = voteCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        averageVote = try container.decode(Float.self, forKey: .averageVote)
        genreIDs = try container.decode([Int].self, forKey: .genreIDs)
        id = try container.decode(Int.self, forKey: .id)
        isAdult = try container.decode(Bool.self, forKey: .isAdult)
        isVideo = try container.decode(Bool.self, forKey: .isVideo)
        originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
        originalTitle = try container.decode(String.self, forKey: .originalTitle)
        overview = try container.decode(String.self, forKey: .overview)
        popularity = try container.decode(Float.self, forKey: .popularity)
        releaseDate = try container.decode(Date.self, forKey: .releaseDate)
        title = try container.decode(String.self, forKey: .title)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
        
        let backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropURL)
        backdropURL = backdropPath != nil
            ? URL(string: "\(Constants.TMDbConstants.backdropImageBaseURLString)\(backdropPath!)")
            : nil
        
        let posterPath = try container.decodeIfPresent(String.self, forKey: .posterURL)
        posterURL = posterPath != nil
            ? URL(string: "\(Constants.TMDbConstants.posterImageBaseURLString)\(posterPath!)")
            : nil
    }
}

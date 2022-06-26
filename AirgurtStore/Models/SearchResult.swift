//
//  SearchResult.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [ResultAPI]
}

struct ResultAPI: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
}

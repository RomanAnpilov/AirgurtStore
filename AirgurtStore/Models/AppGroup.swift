//
//  AppGroup.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import Foundation

enum AppsCategory: String {
    case topFree = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
    case topPaid = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/10/apps.json"
    case mostPlayed = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
}

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let name, artistName, artworkUrl100, id: String
}

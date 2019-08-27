//
//  Movie.swift
//  SearchMovie
//
//  Created by cscoi008 on 2019. 8. 21..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class MovieResponse: NSObject, Codable {
    var lastBuildDate: String?
    var total: Int?
    var start: Int?
    var display: Int?
    var items: [Movie]?
}

class Movie: NSObject, Codable {
    var title: String?
    var link: String?
    var image: String?
    var subtitle: String?
    var pubDate: String?
    var director: String?
    var actor: String?
    var userRating: String?
}

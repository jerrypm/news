//
//  NewsCountry.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 29/09/22.
//

import SwiftUI

struct NewsCountry: Codable {

  enum CodingKeys: String, CodingKey {
    case articles
    case totalResults
    case status
  }

  var articles: [Articles]?
  var totalResults: Int?
  var status: String?


  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    articles = try container.decodeIfPresent([Articles].self, forKey: .articles)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    status = try container.decodeIfPresent(String.self, forKey: .status)
  }

}

struct Articles:  Codable {
    
    enum CodingKeys: String, CodingKey {
      case title
      case author
      case source
      case urlToImage
      case publishedAt
      case content
      case descriptionValue = "description"
      case url
    }
    
    var title: String?
    var author: String?
    var source: Source?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var descriptionValue: String?
    var url: String?
}

struct Source: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case id
  }

  var name: String?
  var id: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(String.self, forKey: .id)
  }

}

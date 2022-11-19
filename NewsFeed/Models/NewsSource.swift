//
//  NewsSource.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 14/10/22.
//

import SwiftUI

struct NewsSource: Codable {

  enum CodingKeys: String, CodingKey {
    case sources
    case status
  }

  var sources: [Sources]?
  var status: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    sources = try container.decodeIfPresent([Sources].self, forKey: .sources)
    status = try container.decodeIfPresent(String.self, forKey: .status)
  }

}

struct Sources: Codable {

  enum CodingKeys: String, CodingKey {
    case country
    case id
    case category
    case descriptionValue = "description"
    case url
    case language
    case name
  }

  var country: String?
  var id: String?
  var category: String?
  var descriptionValue: String?
  var url: String?
  var language: String?
  var name: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    country = try container.decodeIfPresent(String.self, forKey: .country)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    category = try container.decodeIfPresent(String.self, forKey: .category)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    language = try container.decodeIfPresent(String.self, forKey: .language)
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }

}


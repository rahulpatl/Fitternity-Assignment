//
//  Categories.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation

struct Categories: Codable {
  let title, text: String
  let maxCategory: Int
  let allCategoryTitle: String
  let categorytags: [Categorytag]
  let campaign: CategoriesCampaign
  
  enum CodingKeys: String, CodingKey {
    case title, text
    case maxCategory = "max_category"
    case allCategoryTitle = "all_category_title"
    case categorytags, campaign
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    text = try values.decode(String.self, forKey: .text)
    maxCategory = try values.decode(Int.self, forKey: .maxCategory)
    allCategoryTitle = try values.decode(String.self, forKey: .allCategoryTitle)
    categorytags = try values.decode([Categorytag].self, forKey: .categorytags)
    campaign = try values.decode(CategoriesCampaign.self, forKey: .campaign)
  }
}

struct Categorytag: Codable {
  let name, slug: String
  let id: Int
  let image: String
  
  enum CodingKeys: String, CodingKey {
    case name, slug
    case id = "_id"
    case image
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decode(String.self, forKey: .name)
    image = try values.decode(String.self, forKey: .image)
    slug = try values.decode(String.self, forKey: .slug)
    id = try values.decode(Int.self, forKey: .id)
  }
}

struct CategoriesCampaign: Codable {
  let image: String
  let title, bgColor, textColor: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case image, title
    case bgColor = "bg_color"
    case textColor = "text_color"
    case url
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    image = try values.decode(String.self, forKey: .image)
    bgColor = try values.decode(String.self, forKey: .bgColor)
    textColor = try values.decode(String.self, forKey: .textColor)
    url = try values.decode(String.self, forKey: .url)
  }
}

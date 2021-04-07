//
//  Challenge.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
struct Challenge: Codable {
    let title, challengeDescription: String
    let data: [ChallengeDatum]
    let campaign: ChallengeCampaign

    enum CodingKeys: String, CodingKey {
        case title
        case challengeDescription = "description"
        case data, campaign
    }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    challengeDescription = try values.decode(String.self, forKey: .challengeDescription)
    data = try values.decode([ChallengeDatum].self, forKey: .data)
    campaign = try values.decode(ChallengeCampaign.self, forKey: .campaign)
  }
}

struct ChallengeDatum: Codable {
  let challengeID: Int
  let challengeSlug: String
  let priority: Int
  let webImage: String
  let wapImage: String
  let appImage: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case challengeID = "challenge_id"
    case challengeSlug = "challenge_slug"
    case priority
    case webImage = "web_image"
    case wapImage = "wap_image"
    case appImage = "app_image"
    case url
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    challengeID = try values.decode(Int.self, forKey: .challengeID)
    challengeSlug = try values.decode(String.self, forKey: .challengeSlug)
    priority = try values.decode(Int.self, forKey: .priority)
    webImage = try values.decode(String.self, forKey: .webImage)
    wapImage = try values.decode(String.self, forKey: .wapImage)
    appImage = try values.decode(String.self, forKey: .appImage)
    url = try values.decode(String.self, forKey: .url)
  }
}

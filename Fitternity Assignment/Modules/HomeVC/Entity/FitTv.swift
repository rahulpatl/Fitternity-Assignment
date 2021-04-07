//
//  FitTv.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
struct FitTv: Codable {
  let title, fitTvDescription, buttonText: String
  let data: [FitTvDatum]
  let campaign: ChallengeCampaign
  
  enum CodingKeys: String, CodingKey {
    case title
    case fitTvDescription = "description"
    case buttonText = "button_text"
    case data, campaign
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    fitTvDescription = try values.decode(String.self, forKey: .fitTvDescription)
    buttonText = try values.decode(String.self, forKey: .buttonText)
    data = try values.decode([FitTvDatum].self, forKey: .data)
    campaign = try values.decode(ChallengeCampaign.self, forKey: .campaign)
  }
}


struct FitTvDatum: Codable {
    let title: String
    let duration: Int
    let image: String
    let id, difficultyLevel: Int
    let difficultyLevelStr, trainer, category, slug: String

    enum CodingKeys: String, CodingKey {
        case title, duration, image, id
        case difficultyLevel = "difficulty_level"
        case difficultyLevelStr = "difficulty_level_str"
        case trainer, category, slug
    }
}

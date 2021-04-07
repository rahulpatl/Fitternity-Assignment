//
//  PersonalTraining.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
struct PersonalTraining: Codable {
  let title, subtitle, personalTrainingDescription: String
  let image: String
  let buttonText: String
  let link: String
  let campaign: ChallengeCampaign
  
  enum CodingKeys: String, CodingKey {
    case title, subtitle
    case personalTrainingDescription = "description"
    case image
    case buttonText = "button_text"
    case link, campaign
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    subtitle = try values.decode(String.self, forKey: .subtitle)
    personalTrainingDescription = try values.decode(String.self, forKey: .personalTrainingDescription)
    image = try values.decode(String.self, forKey: .image)
    buttonText = try values.decode(String.self, forKey: .buttonText)
    link = try values.decode(String.self, forKey: .link)
    campaign = try values.decode(ChallengeCampaign.self, forKey: .campaign)
  }
}

struct ChallengeCampaign: Codable {
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
    image = try values.decode(String.self, forKey: .image)
    title = try values.decode(String.self, forKey: .title)
    bgColor = try values.decode(String.self, forKey: .bgColor)
    textColor = try values.decode(String.self, forKey: .textColor)
    url = try values.decode(String.self, forKey: .url)
  }
}

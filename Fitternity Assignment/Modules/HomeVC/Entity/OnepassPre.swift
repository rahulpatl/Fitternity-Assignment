//
//  OnepassPre.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
struct OnepassPre: Codable {
  let headerImg: String
  let buttonText: String
  let passes: Passes
  let campaign: CategoriesCampaign
  
  enum CodingKeys: String, CodingKey {
    case headerImg = "header_img"
    case buttonText = "button_text"
    case passes, campaign
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    headerImg = try values.decode(String.self, forKey: .headerImg)
    buttonText = try values.decode(String.self, forKey: .buttonText)
    campaign = try values.decode(CategoriesCampaign.self, forKey: .campaign)
    passes = try values.decode(Passes.self, forKey: .passes)
  }
}

struct Passes: Codable {
  let image: String
  let header1, header1Color, header2 : String
  let subtitle: String?
  let header2Color, subheader, descHeader, onepassType: String
  let passesDescription: String
  
  enum CodingKeys: String, CodingKey {
    case image, header1
    case header1Color = "header1_color"
    case header2, subtitle
    case header2Color = "header2_color"
    case subheader
    case descHeader = "desc_header"
    case onepassType = "onepass_type"
    case passesDescription = "description"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    image = try values.decode(String.self, forKey: .image)
    header1 = try values.decode(String.self, forKey: .header1)
    header1Color = try values.decode(String.self, forKey: .header1Color)
    header2 = try values.decode(String.self, forKey: .header2)
    subtitle = try? values.decode(String.self, forKey: .subtitle)
    header2Color = try values.decode(String.self, forKey: .header2Color)
    subheader = try values.decode(String.self, forKey: .subheader)
    descHeader = try values.decode(String.self, forKey: .descHeader)
    onepassType = try values.decode(String.self, forKey: .onepassType)
    passesDescription = try values.decode(String.self, forKey: .passesDescription)
  }
}

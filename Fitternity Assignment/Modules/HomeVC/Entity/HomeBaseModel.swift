//
//  HomeBaseModel.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
struct HomeBaseModel: Codable {
  let cityName: String
  let cityID: Int
  let instudio: String
  let productTags: [ProductTag]
  let campaigns: [CampaignElement]
  let onepassPre: OnepassPre
  let personalTraining: PersonalTraining
  let upcomingClasses: UpcomingClasses
  let challenge: Challenge
  let fitTv: FitTv
  let sectionOrders: [String]
  let tableData: [TableRows]
  
  enum CodingKeys: String, CodingKey {
    case cityName = "city_name"
    case cityID = "city_id"
    case instudio
    case productTags = "product_tags"
    case campaigns
    case onepassPre = "onepass_pre"
    case personalTraining = "personal_training"
    case upcomingClasses = "upcoming_classes"
    case challenge
    case fitTv = "fit_tv"
    case sectionOrders = "section_orders"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    cityName = try values.decode(String.self, forKey: .cityName)
    cityID = try values.decode(Int.self, forKey: .cityID)
    instudio = try values.decode(String.self, forKey: .instudio)
    productTags = try values.decode([ProductTag].self, forKey: .productTags)
    campaigns = try values.decode([CampaignElement].self, forKey: .campaigns)
    onepassPre = try values.decode(OnepassPre.self, forKey: .onepassPre)
    upcomingClasses = try values.decode(UpcomingClasses.self, forKey: .upcomingClasses)
    personalTraining = try values.decode(PersonalTraining.self, forKey: .personalTraining)
    challenge = try values.decode(Challenge.self, forKey: .challenge)
    fitTv = try values.decode(FitTv.self, forKey: .fitTv)
    sectionOrders = try values.decode([String].self, forKey: .sectionOrders)
    tableData = sectionOrders.map({TableRows(rawValue: $0)!})
  }
}

//
//  HomeModels.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation

struct StudioBaseModel: Codable {
  let cityName: String
  let cityID: Int
  let instudio: String
  let productTags: [ProductTag]?
  let campaigns: [CampaignElement]?
  let categories: Categories?
  let onepassPre: OnepassPre?
  let upcomingClasses: UpcomingClasses
  let fitnessCentres: FitnessCentres
  let sectionOrders: [String]
  let tableData: [TableRows]
  
  enum CodingKeys: String, CodingKey {
    case cityName = "city_name"
    case cityID = "city_id"
    case instudio
    case productTags = "product_tags"
    case campaigns, categories
    case onepassPre = "onepass_pre"
    case upcomingClasses = "upcoming_classes"
    case fitnessCentres = "fitness_centres"
    case sectionOrders = "section_orders"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    cityName = try values.decode(String.self, forKey: .cityName)
    cityID = try values.decode(Int.self, forKey: .cityID)
    instudio = try values.decode(String.self, forKey: .instudio)
    productTags = try? values.decode([ProductTag].self, forKey: .productTags)
    campaigns = try? values.decode([CampaignElement].self, forKey: .campaigns)
    categories = try? values.decode(Categories.self, forKey: .categories)
    onepassPre = try? values.decode(OnepassPre.self, forKey: .onepassPre)
    upcomingClasses = try values.decode(UpcomingClasses.self, forKey: .upcomingClasses)
    fitnessCentres = try values.decode(FitnessCentres.self, forKey: .fitnessCentres)
    sectionOrders = try values.decode([String].self, forKey: .sectionOrders)
    tableData = sectionOrders.map({TableRows(rawValue: $0)!})
  }
}

struct ProductTag: Codable {
  let image: String
  let title, text: String
  let link: String
}

struct CampaignElement: Codable {
  let image: String
  let link: String
  let title: String
  let height, width: Int
  let ratio: Double
  let order: Int
}

enum TableRows: String, CaseIterable {
  case Campaigns = "campaigns"
  case Categories = "categories"
  case OnepassPre = "onepass_pre"
  case UpcomingClasses = "upcoming_classes"
  case FitnessCentres = "fitness_centres"
  case PersonalTraining = "personal_training"
  case Challenge = "challenge"
  case FitTV = "fit_tv"
}























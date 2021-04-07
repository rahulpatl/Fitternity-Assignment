//
//  FitnessCentres.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
struct FitnessCentres: Codable {
    let title, fitnessCentresDescription, buttonText: String
    let data: [FitnessCentresDatum]

    enum CodingKeys: String, CodingKey {
        case title
        case fitnessCentresDescription = "description"
        case buttonText = "button_text"
        case data
    }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    fitnessCentresDescription = try values.decode(String.self, forKey: .fitnessCentresDescription)
    buttonText = try values.decode(String.self, forKey: .buttonText)
    data = try values.decode([FitnessCentresDatum].self, forKey: .data)
  }
}

struct FitnessCentresDatum: Codable {
    let averageRating: Double
    let coverimage: String
    let location, slug: String
    let id: Int
    let categorytags: [String]
    let category: String
    let totalRatingCount: Int
    let flags: DatumFlagsClass
    let commercial: String
    let featured: Bool
    let offeringImages: [OfferingImage]
    let trialHeader, membershipHeader: String
    let membershipIcon: String
    let membershipOfferDefault: Bool
    let membershipOffer, type, address, title: String
    let subcategories: [String]
    let tagImage: String
    let abwVendor: AbwVendorUnion?

    enum CodingKeys: String, CodingKey {
        case averageRating = "average_rating"
        case coverimage, location, slug, id, categorytags, category
        case totalRatingCount = "total_rating_count"
        case flags, commercial, featured
        case offeringImages = "offering_images"
        case trialHeader = "trial_header"
        case membershipHeader = "membership_header"
        case membershipIcon = "membership_icon"
        case membershipOfferDefault = "membership_offer_default"
        case membershipOffer = "membership_offer"
        case type, address, title, subcategories
        case tagImage = "tag_image"
        case abwVendor = "abw_vendor"
    }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    averageRating = try values.decode(Double.self, forKey: .averageRating)
    coverimage = try values.decode(String.self, forKey: .coverimage)
    location = try values.decode(String.self, forKey: .location)
    slug = try values.decode(String.self, forKey: .slug)
    id = try values.decode(Int.self, forKey: .id)
    categorytags = try values.decode([String].self, forKey: .categorytags)
    category = try values.decode(String.self, forKey: .category)
    totalRatingCount = try values.decode(Int.self, forKey: .totalRatingCount)
    flags = try values.decode(DatumFlagsClass.self, forKey: .flags)
    commercial = try values.decode(String.self, forKey: .commercial)
    featured = try values.decode(Bool.self, forKey: .featured)
    offeringImages = try values.decode([OfferingImage].self, forKey: .offeringImages)
    trialHeader = try values.decode(String.self, forKey: .trialHeader)
    membershipHeader = try values.decode(String.self, forKey: .membershipHeader)
    membershipIcon = try values.decode(String.self, forKey: .membershipIcon)
    membershipOfferDefault = try values.decode(Bool.self, forKey: .membershipOfferDefault)
    membershipOffer = try values.decode(String.self, forKey: .membershipOffer)
    type = try values.decode(String.self, forKey: .type)
    title = try values.decode(String.self, forKey: .title)
    address = try values.decode(String.self, forKey: .address)
    subcategories = try values.decode([String].self, forKey: .subcategories)
    tagImage = try values.decode(String.self, forKey: .tagImage)
    abwVendor = try? values.decode(AbwVendorUnion.self, forKey: .abwVendor)
  }
}

struct DatumFlagsClass: Codable {
    let trial, membership: String
    let topSelling, newlyLaunched, openingSoon, comingOnOnepass: Bool
    let state: String
    let featured, april5, notAvailableOnOnepass, forcedOnOnepass: Bool
    let liteClasspassAvailable: Bool
    let covidState: String
    let covidStateID: Int
    let covidStateImmediately: Bool
    let monsoonFlashDiscount: String?
    let monsoonFlashDiscountPer: Int
    let monsoonFlashDiscountDisabled: Bool
    let hyperLocalList: [String]

    enum CodingKeys: String, CodingKey {
        case trial, membership
        case topSelling = "top_selling"
        case newlyLaunched = "newly_launched"
        case openingSoon = "opening_soon"
        case comingOnOnepass = "coming_on_onepass"
        case state, featured, april5
        case notAvailableOnOnepass = "not_available_on_onepass"
        case forcedOnOnepass = "forced_on_onepass"
        case liteClasspassAvailable = "lite_classpass_available"
        case covidState = "covid_state"
        case covidStateID = "covid_state_id"
        case covidStateImmediately = "covid_state_immediately"
        case monsoonFlashDiscount = "monsoon_flash_discount"
        case monsoonFlashDiscountPer = "monsoon_flash_discount_per"
        case monsoonFlashDiscountDisabled = "monsoon_flash_discount_disabled"
        case hyperLocalList = "hyper_local_list"
    }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    trial = try values.decode(String.self, forKey: .trial)
    membership = try values.decode(String.self, forKey: .membership)
    topSelling = try values.decode(Bool.self, forKey: .topSelling)
    newlyLaunched = try values.decode(Bool.self, forKey: .newlyLaunched)
    openingSoon = try values.decode(Bool.self, forKey: .openingSoon)
    comingOnOnepass = try values.decode(Bool.self, forKey: .comingOnOnepass)
    state = try values.decode(String.self, forKey: .state)
    featured = try values.decode(Bool.self, forKey: .featured)
    april5 = try values.decode(Bool.self, forKey: .april5)
    notAvailableOnOnepass = try values.decode(Bool.self, forKey: .notAvailableOnOnepass)
    forcedOnOnepass = try values.decode(Bool.self, forKey: .forcedOnOnepass)
    liteClasspassAvailable = try values.decode(Bool.self, forKey: .liteClasspassAvailable)
    covidState = try values.decode(String.self, forKey: .covidState)
    covidStateID = try values.decode(Int.self, forKey: .covidStateID)
    covidStateImmediately = try values.decode(Bool.self, forKey: .covidStateImmediately)
    monsoonFlashDiscount = try? values.decode(String.self, forKey: .monsoonFlashDiscount)
    monsoonFlashDiscountPer = try values.decode(Int.self, forKey: .monsoonFlashDiscountPer)
    monsoonFlashDiscountDisabled = try values.decode(Bool.self, forKey: .monsoonFlashDiscountDisabled)
    hyperLocalList = try values.decode([String].self, forKey: .hyperLocalList)
  }
}

struct OfferingImage: Codable {
    let image: String
    let height, width: Int
}

enum AbwVendorUnion: Codable {
    case abwVendorClass(AbwVendorClass)
    case anythingArray([JSONAny])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(AbwVendorClass.self) {
            self = .abwVendorClass(x)
            return
        }
        throw DecodingError.typeMismatch(AbwVendorUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AbwVendorUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .abwVendorClass(let x):
            try container.encode(x)
        case .anythingArray(let x):
            try container.encode(x)
        }
    }
}

struct AbwVendorClass: Codable {
    let physical: String
    let online: String?
}

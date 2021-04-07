//
//  UpcomingClasses.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
struct UpcomingClasses: Codable {
    let title, upcomingClassesDescription, buttonText: String
    let campaign: CategoriesCampaign
    let sessionType: String
    let data: [UpcomingClassesDatum]

    enum CodingKeys: String, CodingKey {
        case title
        case upcomingClassesDescription = "description"
        case buttonText = "button_text"
        case campaign
        case sessionType = "session_type"
        case data
    }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    upcomingClassesDescription = try values.decode(String.self, forKey: .upcomingClassesDescription)
    buttonText = try values.decode(String.self, forKey: .buttonText)
    sessionType = try values.decode(String.self, forKey: .sessionType)
    campaign = try values.decode(CategoriesCampaign.self, forKey: .campaign)
    data = try values.decode([UpcomingClassesDatum].self, forKey: .data)
    
  }
}

struct UpcomingClassesDatum: Codable {
  let averageRating: Double
  let name, slug, vendorSlug, vendorName: String
  let coverimage: String
  let overlayimage, nextSlot: String
  let totalSlots: String?
  let totalRatingCount: Int
  let location: String?
  let address: Address?
  let specialPrice: Int?
  let commercial, serviceType: String
  let campaignText: String?
  let id: Int
  let bookingPoints: Int?
  let sessionTime: Int
  let overlayimageV2: Overlay?
  let ppsOneliner: String
  let flags: FlagsUnion
  let overlayDetails: [Overlay]
  let tagImage: String?
  let city: String?
  let liveLocation: String?
  let liveLocationIcon: String?
  let bestSeller: Bool?
  
  enum CodingKeys: String, CodingKey {
    case averageRating = "average_rating"
    case name, slug
    case vendorSlug = "vendor_slug"
    case vendorName = "vendor_name"
    case coverimage, overlayimage
    case totalSlots = "total_slots"
    case nextSlot = "next_slot"
    case totalRatingCount = "total_rating_count"
    case location, address
    case specialPrice = "special_price"
    case campaignText = "campaign_text"
    case commercial
    case serviceType = "service_type"
    case id, city
    case bookingPoints = "booking_points"
    case sessionTime = "session_time"
    case overlayimageV2 = "overlayimage_v2"
    case ppsOneliner = "pps_oneliner"
    case flags
    case overlayDetails = "overlay_details"
    case tagImage = "tag_image"
    case liveLocation = "live_location"
    case liveLocationIcon = "live_location_icon"
    case bestSeller = "best_seller"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    averageRating = try values.decode(Double.self, forKey: .averageRating)
    name = try values.decode(String.self, forKey: .name)
    slug = try values.decode(String.self, forKey: .slug)
    vendorSlug = try values.decode(String.self, forKey: .vendorSlug)
    vendorName = try values.decode(String.self, forKey: .vendorName)
    coverimage = try values.decode(String.self, forKey: .coverimage)
    overlayimage = try values.decode(String.self, forKey: .overlayimage)
    totalSlots = try? values.decode(String.self, forKey: .totalSlots)
    nextSlot = try values.decode(String.self, forKey: .nextSlot)
    totalRatingCount = try values.decode(Int.self, forKey: .totalRatingCount)
    location = try? values.decode(String.self, forKey: .location)
    address = try? values.decode(Address.self, forKey: .address)
    specialPrice = try? values.decode(Int.self, forKey: .specialPrice)
    campaignText = try? values.decode(String.self, forKey: .campaignText)
    commercial = try values.decode(String.self, forKey: .commercial)
    serviceType = try values.decode(String.self, forKey: .serviceType)
    id = try values.decode(Int.self, forKey: .id)
    bookingPoints = try? values.decode(Int.self, forKey: .bookingPoints)
    sessionTime = try values.decode(Int.self, forKey: .sessionTime)
    overlayimageV2 = try? values.decode(Overlay.self, forKey: .overlayimageV2)
    flags = try values.decode(FlagsUnion.self, forKey: .flags)
    ppsOneliner = try values.decode(String.self, forKey: .ppsOneliner)
    overlayDetails = try values.decode([Overlay].self, forKey: .overlayDetails)
    tagImage = try? values.decode(String.self, forKey: .tagImage)
    city = try? values.decode(String.self, forKey: .city)
    liveLocation = try? values.decode(String.self, forKey: .liveLocation)
    liveLocationIcon = try? values.decode(String.self, forKey: .liveLocationIcon)
    bestSeller = try? values.decode(Bool.self, forKey: .bestSeller)
  }
}

struct Address: Codable {
    let pincode: Int?
    let location, line3, landmark, line2: String
    let line1: String
}

struct Overlay: Codable {
    let icon: String
    let text: String
}

enum FlagsUnion: Codable {
    case anythingArray([JSONAny])
    case flagsFlags(FlagsFlags)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(FlagsFlags.self) {
            self = .flagsFlags(x)
            return
        }
        throw DecodingError.typeMismatch(FlagsUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for FlagsUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .flagsFlags(let x):
            try container.encode(x)
        }
    }
}

struct FlagsFlags: Codable {
    let onepassMaxBookingCount: Int

    enum CodingKeys: String, CodingKey {
        case onepassMaxBookingCount = "onepass_max_booking_count"
    }
}

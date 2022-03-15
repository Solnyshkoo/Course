//
//  EventsInfoAPIModel.swift
//  Course
//
//  Created by Ksenia Petrova on 15.03.2022.
//

import Foundation
struct EventsInfoApi: Codable {
    let id: Int
    let dates: DateElement
    let title, slug: String
    let images: ImageInfo
    let siteURL: String
    let shortTitle: String
    enum CodingKeys: String, CodingKey {
        case id
        case dates, title, slug
        case images
        case siteURL = "site_url"
        case shortTitle = "short_title"
    }
}

// MARK: - DateElement
struct DateElement: Codable {
    let start, end: Int
}

// MARK: - Image
struct ImageInfo: Codable {
    let image: String
    let source: Source
}

// MARK: - Source
struct Source: Codable {
    let name: String
    let link: String
}


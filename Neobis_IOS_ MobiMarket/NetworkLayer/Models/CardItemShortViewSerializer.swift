//
//  CardItemShortViewSerializer.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 1/7/23.
//

import Foundation

struct CardItemShortViewSerializers: Codable {
    let id: Int
    let title: String
    let price: Int
    let images: String?
    let shortDescription: String
}

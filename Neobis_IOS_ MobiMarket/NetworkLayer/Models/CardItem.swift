//
//  CardItem.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 1/7/23.
//

import Foundation
struct CardItemCRUDViewSet: Codable {
    let id: Int
    let userId: Int
    let title: String
    let price: Int
    let images: String?
    let shortDescription: String
    let detailedDescription: String
}

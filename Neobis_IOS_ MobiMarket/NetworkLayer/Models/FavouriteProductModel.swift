//
//  FavouriteProductModel.swift
//  Neobis_IOS_ MobiMarket
//
//  Created by Eldar Gaiypov on 10/7/23.
//

import Foundation
struct FavouriteProductModel: Codable {
    let id: Int
    let user_id: Int
    let title: String
    let price: Int
    let total_likes: String?
    let user_like: String?
    let images: String?
    let short_description: String
    let detailed_description: String
}

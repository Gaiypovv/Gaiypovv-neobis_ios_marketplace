//
//  UserCreateModel.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 1/7/23.
//

import Foundation

struct UserCreateRequest: Codable {
    let username: String
    let email: String
    let password: String
    let passwordRepeat: String
}


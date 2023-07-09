//
//  TokenResponse.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 1/7/23.
//

import Foundation

struct TokenObtainPair: Codable {
    let email: String
    let password: String
}

struct TokenResponse: Codable {
    let refresh: String
    let access: String
}


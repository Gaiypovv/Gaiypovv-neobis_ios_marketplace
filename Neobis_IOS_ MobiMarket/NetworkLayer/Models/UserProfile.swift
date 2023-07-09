//
//  UserProfile.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 1/7/23.
//

import Foundation

struct UserProfile: Codable {
    let firstName: String
    let lastName: String
    let username: String
    let email: String?
    let avatar: String?
    let birthDate: String?
    let phoneNumber: String
}

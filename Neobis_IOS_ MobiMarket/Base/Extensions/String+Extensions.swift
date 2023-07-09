//
//  String+Extensions.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation

extension String {
    func countOccurences(of searchString: String, in range: NSRange) -> Int {
        let substring = (self as NSString).substring(with: range)
        return substring.components(separatedBy: searchString).count - 1
    }
}

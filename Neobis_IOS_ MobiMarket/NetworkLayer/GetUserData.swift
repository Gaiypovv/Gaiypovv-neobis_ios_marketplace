//
//  GetUserData.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation
import Foundation
import Alamofire

protocol GetUserProtocol {
    func fetchUserData(accessToken: String, completion: @escaping (Result<[String: Any], Error>) -> Void)
}

class GetUserViewModel: GetUserProtocol {
    let apiService: APIService
    
    init() {
        self.apiService = APIService()
    }
    
    func fetchUserData(accessToken: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request("http://165.232.115.38:8000/api/v1/account/profile/", headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let userData = value as? [String: Any] {
                    completion(.success(userData))
                } else {
                    let error = NSError(domain: "UserDataParsingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse user data"])
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

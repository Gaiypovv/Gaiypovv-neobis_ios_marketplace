//
//  LoginViewModel.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation

protocol LoginProtocol {
    var isLoggedIn: Bool { get }
    var loginResult: ((Result<Data, Error>) -> Void)? { get set }
    
    func login(username: String, password: String)
}

class LoginViewModel: LoginProtocol {
    
    var isLoggedIn: Bool = false
    var loginResult: ((Result<Data, Error>) -> Void)?
    
    let apiService: APIService
    
    init() {
        self.apiService = APIService()
    }
    
    func login(username: String, password: String) {
        let parameters: [String: Any] = ["username": username, "password": password]
        
        apiService.post(endpoint: "account/login/", parameters: parameters) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    if let tokenResponse = try? decoder.decode(TokenResponse.self, from: data) {
                        AuthManager.shared.accessToken = tokenResponse.access
                        
                        self?.isLoggedIn = true
                        self?.loginResult?(.success(data))
                    }
                case .failure(let error):
                    print("fail")
                    self?.isLoggedIn = false
                    self?.loginResult?(.failure(error))
                }
            }
        }
    }
}

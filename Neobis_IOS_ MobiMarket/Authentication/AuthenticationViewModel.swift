//
//  AuthenticationViewModel.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation
import Alamofire

// MARK: - Protocols

protocol AuthenticationProtocol {
    var isLoggedIn: Bool { get }
    var loginResult: ((Result<Data, Error>) -> Void)? { get set }
    var isRegistered: Bool { get }
    var registerResult: ((Result<Data, Error>) -> Void)? { get set }
    
    func login(username: String, password: String)
    func register(password: String, passwordRepeat: String)
    func fullRegister(phoneNumber: String, firstName: String, lastName: String, birthday: String, photo: String)
}

// MARK: - ViewModel

class AuthenticationViewModel: AuthenticationProtocol {
    
    var isLoggedIn: Bool = false
    var loginResult: ((Result<Data, Error>) -> Void)?
    
    var isRegistered: Bool = false
    var registerResult: ((Result<Data, Error>) -> Void)?
    
    let apiService: APIService
    
    private let userName: String
    private let email: String
    
    private let firstName: String
    private let lastName: String
    private let birthday: String
    private let photo: String
    
    init(userName: String, email: String, firstName: String, lastName: String, birthday: String, photo: String) {
        self.apiService = APIService()
        self.userName = userName
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.photo = photo
    }
    
    func login(username: String, password: String) {
        let parameters: [String: Any] = ["username": username, "password": password]
        
        apiService.post(endpoint: "account/login/", parameters: parameters) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    if let tokenResponse = try? decoder.decode(TokenObtainPairResponse.self, from: data) {
                        AuthManager.shared.accessToken = tokenResponse.accessToken
                        self?.isLoggedIn = true
                        self?.loginResult?(.success(data))
                    }
                case .failure(let error):
                    self?.isLoggedIn = false
                    self?.loginResult?(.failure(error))
                }
            }
        }
    }
    
    func register(password: String, passwordRepeat: String) {
        let parameters: [String: Any] = ["username": userName, "email": email, "password": password, "password_repeat": passwordRepeat]
        
        apiService.post(endpoint: "account/register/", parameters: parameters) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.isRegistered = true
                    self?.registerResult?(.success(data))
                case .failure(let error):
                    self?.isRegistered = false
                    self?.registerResult?(.failure(error))
                }
            }
        }
    }
    
    func fullRegister(phoneNumber: String, firstName: String, lastName: String, birthday: String, photo: String) {
        let parameters: [String: Any] = [
            "first_name": firstName,
            "last_name": lastName,
            "birthday": birthday,
            "phone_number": phoneNumber,
            "photo": photo
        ]
        
        guard let accessToken = AuthManager.shared.accessToken else {
            return
        }
        
        let endpoint = "account/full_register/"
        
        apiService.postWithBearerToken(endpoint: endpoint, parameters: parameters, bearerToken: accessToken) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.isRegistered = true
                    self?.registerResult?(.success(data))
                case .failure(let error):
                    self?.isRegistered = false
                    self?.registerResult?(.failure(error))
                }
            }
        }
    }
}

// MARK: - APIService

class APIService {
    func post(endpoint: String, parameters: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
        let url = "http://165.232.115.38:8000" + endpoint // Update with your API base URL
        
        AF.request(url, method: .post, parameters: parameters)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func postWithBearerToken(endpoint: String, parameters: [String: Any], bearerToken: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = "http://165.232.115.38:8000" + endpoint // Update with your API base URL
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(bearerToken)"
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

// MARK: - Models

struct TokenObtainPairResponse: Codable {
    let accessToken: String
}


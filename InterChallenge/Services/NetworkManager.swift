//
//  NetworkManager.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 12/10/21.
//
import Alamofire
import Foundation
import UIKit

final class NetworkManager: NetworkCapable {
    
    static let shared = NetworkManager()
    
    init() {}
        
    func getUsers (completed: @escaping (Result<[User], NetworkError>) -> Void) {
        
        let endpoint = URLSection.domain + URLSection.users

        AF.request(endpoint).validate().responseJSON { response in
            guard response.error == nil else {
                    completed(.failure(.invalidResponse))
                return
                }
            
            do {
                if let data = response.data {
                    let users = try JSONDecoder().decode([User].self, from: data)
                        completed(.success(users))
                    } else {
                        completed(.failure(.invalidData))
                        return
                    }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
                completed(.failure(.failedToDecodeResponse))

            }
        }
    }
}

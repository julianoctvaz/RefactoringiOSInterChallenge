//
//  NetworkCapable.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import Foundation


protocol NetworkCapable {
    func getUsers(completed: @escaping (Result<[User], NetworkError>) -> Void)
}

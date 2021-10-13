//
//  NetworkCapable.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import Foundation


protocol NetworkCapable {
    func getUsers(completed: @escaping (Result<[User], NetworkError>) -> Void)
    func getPosts (from userId: Int, completed: @escaping (Result<[Post], NetworkError>) -> Void)
    func getComments (from postId: Int, completed: @escaping (Result<[Comment], NetworkError>) -> Void)
    func getAlbums (from albumId: Int, completed: @escaping (Result<[Album], NetworkError>) -> Void)
    func getPhotos(from albumId: Int, completed: @escaping (Result<[Photo], NetworkError>) -> Void)

}

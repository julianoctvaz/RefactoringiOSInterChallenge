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
    
    func getPosts (from userId: Int, completed: @escaping (Result<[Post], NetworkError>) -> Void) {
        
        let endpoint = URLSection.domain + URLSection.posts + "\(userId)"
        
        AF.request(endpoint).validate().responseJSON { response in
            guard response.error == nil else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                if let data = response.data {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completed(.success(posts))
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
    
    func getComments (from postId: Int, completed: @escaping (Result<[Comment], NetworkError>) -> Void) {
        
        let endpoint = URLSection.domain + URLSection.comments + "\(postId)"
        
        AF.request(endpoint).validate().responseJSON { response in
            guard response.error == nil else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                if let data = response.data {
                    let comments = try JSONDecoder().decode([Comment].self, from: data)
                    completed(.success(comments))
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
    
    func getAlbums (from userId: Int, completed: @escaping (Result<[Album], NetworkError>) -> Void) {
        
        let endpoint = URLSection.domain + URLSection.albums + "\(userId)"
        
        AF.request(endpoint).validate().responseJSON { response in
            guard response.error == nil else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                if let data = response.data {
                    let albums = try JSONDecoder().decode([Album].self, from: data)
                    completed(.success(albums))
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
    
    func getPhotos (from albumId: Int, completed: @escaping (Result<[Photo], NetworkError>) -> Void) {
        
        let endpoint = URLSection.domain + URLSection.photos + "\(albumId)"
        
        AF.request(endpoint).validate().responseJSON { response in
            guard response.error == nil else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                if let data = response.data {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    completed(.success(photos))
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
    
    func getPhotosThumbnail(_ photo: Photo, _ cell: PhotoTableViewCell) -> Void {
        AF.download(photo.thumbnailUrl).responseData { response in
            switch response.result {
            case .success(let data):
                cell.photoImageView.image = UIImage(data: data)
            default:
                break
            }
        }
    }
}

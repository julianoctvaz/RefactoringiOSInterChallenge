//
//  MainCoordinator.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 16/10/21.
//

import Foundation
import UIKit

final class CoordinatorManager: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let rootViewController = ChallengeViewController()
        rootViewController.coordinator = self
        navigationController.pushViewController(rootViewController, animated: false)
    }
    
    func postsTable(with userId: Int, by name: String) {
        
        let vc = PostTableViewController()
        vc.coordinator = self
        vc.userId = userId
        vc.userName = name
        navigationController.pushViewController(vc, animated: true)
    }
    
    func albumsTable(with userId: Int, by name: String) {
        
        let vc = AlbumTableViewController()
        vc.coordinator = self
        vc.userId = userId
        vc.userName = name
        navigationController.pushViewController(vc, animated: true)
    }
    
    func postsToComments(with postId: Int, by username: String) {
        
        let vc = CommentTableViewController()
        vc.coordinator = self
        vc.postId = postId
        vc.userName = username
        navigationController.pushViewController(vc, animated: true)
    }
    
    func albumToPhoto(with albumId: Int, by username: String) {
        
        let vc = PhotoTableViewController()
        vc.coordinator = self
        vc.albumId = albumId
        vc.userName = username
        navigationController.pushViewController(vc, animated: true)
    }
    
    func photoToDetails(with title: String, by image: UIImage){
        
        let vc = DetailsViewController()
        vc.coordinator = self
        vc.name = title
        vc.photo = image
        navigationController.pushViewController(vc, animated: true)
    }
}


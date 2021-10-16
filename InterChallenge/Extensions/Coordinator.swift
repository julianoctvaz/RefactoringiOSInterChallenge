//
//  Coordinator.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 16/10/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

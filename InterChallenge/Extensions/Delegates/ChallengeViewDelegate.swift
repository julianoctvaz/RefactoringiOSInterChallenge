//
//  ChallengeViewDelegate.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

extension ChallengeViewController: UserTableViewCellDelegate {
    
    func didTapAlbums(with userId: Int, by name: String) {
        let userIdAndName = (id: userId, name: name)
        performSegue(withIdentifier: "challengeToAlbum", sender: userIdAndName)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        let userIdAndName = (id: userId, name: name)
        performSegue(withIdentifier: "challengeToPost", sender: userIdAndName)
    }
    
    //    func setUsers (users: [User]){
    //        self.users = users
    //        }
    //
    //    func fetchUsers(){
    //        NetworkManager.shared.getUsers(completed: { [weak self] response in
    //            switch response {
    //            case .success(let result):
    //                self?.setUsers(users: result)
    //            case .failure(let error):
    //                print("Error during JSON serialization: \(error.localizedDescription). \(error.rawValue)")
    //                self!.willDisplayAnErrorHandlerMessage()
    //            }
    //        })
    //    }
    //    }
}

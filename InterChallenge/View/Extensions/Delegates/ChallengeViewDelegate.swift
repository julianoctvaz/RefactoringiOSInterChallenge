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
}

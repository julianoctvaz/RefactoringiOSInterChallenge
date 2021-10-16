//
//  ChallengeViewDelegate.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

extension ChallengeViewController: UserTableViewCellDelegate {
    
    func didTapAlbums(with userId: Int, by name: String) {
        self.coordinator?.albumsTable(with: userId, by: name)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        self.coordinator?.postsTable(with: userId, by: name)
    }
    
}

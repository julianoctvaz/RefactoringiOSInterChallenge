//
//  PostTableViewDelegate.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import UIKit

extension PostTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = posts[indexPath.row].id
        self.coordinator?.postsToComments(with: postId, by: userName)
    }

}

//
//  AlbumTableViewDelegate.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import UIKit

extension AlbumTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumId = albums[indexPath.row].id
        performSegue(withIdentifier: "albumToPhoto", sender: albumId)
    }
}

//
//  AlbumTableViewDataSource.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import UIKit

extension AlbumTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        
        let album = albums[indexPath.row]
        cell.albumNameLabel.text = album.title
        cell.completeSeparatorLine(cell)
        
        return cell
    }
}

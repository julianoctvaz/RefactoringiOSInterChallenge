//
//  PhotoTableViewDataSource.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import UIKit
import Alamofire

extension PhotoTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoTableViewCell else {
            return UITableViewCell()
        }
        
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title
        
        AF.download(photo.thumbnailUrl).responseData { response in //verificar 
            switch response.result {
            case .success(let data):
                cell.photoImageView.image = UIImage(data: data)
            default:
                break
            }
        }
        
        return cell
    }
}

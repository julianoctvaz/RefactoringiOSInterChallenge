//
//  PhotoTableViewDelegate.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import UIKit
import Alamofire

extension PhotoTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        AF.download(photo.url).responseData { response in 
            switch response.result {
                case .success(let data):
                self.coordinator?.photoToDetails(with: photo.title, by: UIImage(data: data)!)
                default:
                    break
                }
            }
    }
}

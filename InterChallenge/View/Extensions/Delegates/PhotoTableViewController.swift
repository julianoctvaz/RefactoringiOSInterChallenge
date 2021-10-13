//
//  PhotoTableViewController.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import UIKit
import Alamofire

extension PhotoTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        AF.download(photo.url).responseData { response in //verificar
            switch response.result {
                case .success(let data):
                    self.performSegue(withIdentifier: "photoToDetail",
                                      sender: (photo: UIImage(data: data), name: photo.title))
                default:
                    break
                }
            }
    }
}

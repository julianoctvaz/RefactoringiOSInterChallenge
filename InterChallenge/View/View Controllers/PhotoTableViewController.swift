import Alamofire
import UIKit

class PhotoTableViewController: UITableViewController {

    var albumId = Int()
    var userName = String()
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Fotos de \(userName)"
        self.tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        self.getPhotos(from: albumId)
    }
    
    private func getPhotos(from albumId: Int) {
        NetworkManager.shared.getPhotos(from: albumId, completed: { [weak self] response in
            switch response {
            case .success(let result):
                self!.photos = result
                self!.tableView?.reloadData()
            case .failure(let error):
                print("Error during JSON serialization: \(error.localizedDescription). \(error.rawValue)")
                self!.willDisplayAnErrorHandlerMessage()
            }
        })
        
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatinVC = segue.destination as? DetailsViewController {
            if let info = sender as? (photo: UIImage, name: String) {
                destinatinVC.photo = info.photo
                destinatinVC.name = info.name
            }
        }
    }
}

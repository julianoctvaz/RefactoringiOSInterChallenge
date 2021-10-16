import Alamofire
import UIKit

final class PhotoTableViewController: UITableViewController {

    var albumId = Int()
    var userName = String()
    var photos = [Photo]()
    weak var coordinator: CoordinatorManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Fotos de \(userName)"
        self.tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        self.getPhotos(from: albumId)
    }
    
    // MARK: - Network
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
}

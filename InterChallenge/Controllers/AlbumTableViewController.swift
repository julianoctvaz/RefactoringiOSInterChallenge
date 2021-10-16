import Alamofire
import UIKit

final class AlbumTableViewController: UITableViewController {

    var userId = Int()
    var userName = String()
    var albums = [Album]()
    weak var coordinator: CoordinatorManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Álbuns de \(userName)"
        self.tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        self.getAlbums(from: userId)
    }
    
    // MARK: - Network
    private func getAlbums(from userId: Int) {
        NetworkManager.shared.getAlbums(from: userId, completed: { [weak self] response in
            switch response {
            case .success(let result):
                self!.albums = result
                self!.tableView?.reloadData()
            case .failure(let error):
                print("Error during JSON serialization: \(error.localizedDescription). \(error.rawValue)")
                self!.willDisplayAnErrorHandlerMessage()
            }
        })
    }
}



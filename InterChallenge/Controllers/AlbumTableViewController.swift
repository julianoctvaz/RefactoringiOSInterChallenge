import Alamofire
import UIKit

class AlbumTableViewController: UITableViewController {

    var userId = Int()
    var userName = String()
    var albums = [Album]()

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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatoinVC = segue.destination as? PhotoTableViewController {
            if let albumId = sender as? Int {
                destinatoinVC.userName = userName
                destinatoinVC.albumId = albumId
            }
        }
    }
}



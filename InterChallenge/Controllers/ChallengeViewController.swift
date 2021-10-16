import Alamofire
import UIKit

class ChallengeViewController: UITableViewController {
 
    var users = [User]()
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        self.fetchUsers()
    }
    
    // MARK: - Network
    private func fetchUsers() {
        NetworkManager.shared.getUsers(completed: { [weak self] response in
            switch response {
                case .success(let result):
                    self!.users = result
                self!.tableView?.reloadData()
                case .failure(let error):
                    print("Error during JSON serialization: \(error.localizedDescription). \(error.rawValue)")
                    self!.willDisplayAnErrorHandlerMessage()
            }
        })
}
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? AlbumTableViewController {
            if let info = sender as? (id: Int, name: String) {
                destinationVC.userId = info.id
                destinationVC.userName = info.name
            }
        }
        
        if let destinationVC = segue.destination as? PostTableViewController {
            if let info = sender as? (id: Int, name: String) {
                destinationVC.userId = info.id
                destinationVC.userName = info.name
            }
        }
    }
}





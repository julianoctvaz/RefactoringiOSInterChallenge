import Alamofire
import UIKit

final class ChallengeViewController: UITableViewController {
 
    var users = [User]()
    weak var coordinator: CoordinatorManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Desafio"
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
}





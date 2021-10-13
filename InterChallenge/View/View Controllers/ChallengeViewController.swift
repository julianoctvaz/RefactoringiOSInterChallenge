import Alamofire
import UIKit

class ChallengeViewController: UITableViewController {
 
    var users = [User]()
//    private weak var viewModel: ChallengeViewModel?
//    private var mainCoordinator: MainCoordinator?

//    init(viewModel: ChallengeViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//        self.viewModel!.controllerDelegate = self
//    }
    
//     required init?(coder aDecoder: NSCoder) {
//         super.init(nibName: nil, bundle: nil)
//         self.mainCoordinator = self.viewModel?.coordinator
//         self.viewModel? = ChallengeViewModel(coordinator: mainCoordinator!)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCell")
//        viewModel?.controllerDelegate? = self
//        viewModel?.controllerDelegate?.fetchUsers()
        self.fetchUsersTemporary()

    }
    
    private func fetchUsersTemporary() {
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





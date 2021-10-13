import Alamofire
import UIKit

final class ChallengeViewController: UITableViewController {
 
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
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


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.selectionStyle = .none
        cell.id = user.id
        cell.initialsLabel.text = String(user.name.prefix(2))
        cell.nameLabel.text = user.name
        cell.userNameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        cell.delegate = self
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .white : UIColor(white: 0.667, alpha: 0.2)
        return cell
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

extension ChallengeViewController: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        let userIdAndName = (id: userId, name: name)
        performSegue(withIdentifier: "challengeToAlbum", sender: userIdAndName)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        let userIdAndName = (id: userId, name: name)
        performSegue(withIdentifier: "challengeToPost", sender: userIdAndName)
    }
    
    
}

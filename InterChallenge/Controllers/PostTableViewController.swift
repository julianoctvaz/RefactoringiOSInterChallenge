import Alamofire
import UIKit

final class PostTableViewController: UITableViewController {
    
    var userId = Int()
    var userName = String()
    var posts = [Post]()
    weak var coordinator: CoordinatorManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Postagens de \(userName)"
        self.tableView.register(TitleAndDescriptionTableViewCell.self,
                           forCellReuseIdentifier: "TitleAndDescriptionCell")
        self.fetchPosts(from: userId)
    }
    
    // MARK: - Network
    private func fetchPosts(from userId: Int) {
        NetworkManager.shared.getPosts(from: userId, completed: { [weak self] response in
            switch response {
            case .success(let result):
                self!.posts = result
                self!.tableView?.reloadData()
            case .failure(let error):
                print("Error during JSON serialization: \(error.localizedDescription). \(error.rawValue)")
                self!.willDisplayAnErrorHandlerMessage()
            }
        })
    }
}


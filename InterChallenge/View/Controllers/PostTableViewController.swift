import Alamofire
import UIKit

class PostTableViewController: UITableViewController {
    
    var userId = Int()
    var userName = String()
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Postagens de \(userName)"
        self.tableView.register(TitleAndDescriptionTableViewCell.self,
                           forCellReuseIdentifier: "TitleAndDescriptionCell")
        self.fetchPostsTemporary(from: userId)
    }
    
    private func fetchPostsTemporary(from userId: Int) {
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
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatoinVC = segue.destination as? CommentTableViewController {
            if let postId = sender as? Int {
                destinatoinVC.userName = userName
                destinatoinVC.postId = postId
            }
        }
    }
}


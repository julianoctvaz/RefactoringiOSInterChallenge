import Alamofire
import UIKit

class CommentTableViewController: UITableViewController {
    
    var postId = Int()
    var userName = String()
    var comments = [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comentários de \(userName)"
        self.tableView.register(TitleAndDescriptionTableViewCell.self,
                           forCellReuseIdentifier: "TitleAndDescriptionCell")
        self.getComments(from: postId)
    }
    
    // MARK: - Network
    private func getComments(from postId: Int) {
        NetworkManager.shared.getComments(from: postId, completed: { [weak self] response in
            switch response {
            case .success(let result):
                self!.comments = result
                self!.tableView?.reloadData()
            case .failure(let error):
                print("Error during JSON serialization: \(error.localizedDescription). \(error.rawValue)")
                self!.willDisplayAnErrorHandlerMessage()
            }
        })
   }

    
}



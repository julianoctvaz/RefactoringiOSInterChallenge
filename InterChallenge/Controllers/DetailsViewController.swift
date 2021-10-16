import UIKit


final class DetailsViewController: UIViewController, ViewCode {

    @TemplateView private var detailImageView: UIImageView
    @TemplateView private var nameLabel: UILabel
    lazy var photo = UIImage()
    lazy var name = String()
    weak var coordinator: CoordinatorManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
  
    }
    
    func setupView() {
        addSubViews()
        setupUIConfiguration()
        setupContraints()
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([
            detailImageView.widthAnchor.constraint(equalToConstant: 366),
            detailImageView.heightAnchor.constraint(equalToConstant: 250),
            
            detailImageView.bottomAnchor.constraint(equalTo:  nameLabel.topAnchor, constant: -16),
            detailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,  constant: 16),
            
            detailImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            detailImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            
            nameLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor,  constant: 16),
            
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }
    
    
    func setupUIConfiguration(){
        
        detailImageView.image = self.photo
        detailImageView.contentMode = .scaleAspectFit
        
        nameLabel.text = self.name
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.contentMode = .left
        nameLabel.numberOfLines = 0
        
        navigationItem.title = ConstantsStrings.challengeButtonBackTitle
        let backButton = UIBarButtonItem()
        backButton.title = ConstantsStrings.photosButtonBackTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func addSubViews(){
        view.addSubview(detailImageView)
        view.addSubview(nameLabel)
    }
    
}

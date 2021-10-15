import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell, ViewCode {
 
    
    @TemplateView var initialsLabel: UILabel
    @TemplateView var nameLabel: UILabel
    @TemplateView var usernameLabel: UILabel
    @TemplateView var phoneLabel: UILabel
    @TemplateView var emailLabel: UILabel
    
    @TemplateView private var divider: UIView
    
    @TemplateView private var HStackalbumsPosts: UIStackView
    @TemplateView private var VStackUserEmailPhoto: UIStackView
    @TemplateView private var VStackInitialsName: UIStackView
    @TemplateView private var HStackBindingHorizontalStacks: UIStackView
    
    @TemplateView private var albumsButton: UIButton
    @TemplateView private var postsButton: UIButton
    
   
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([

            HStackBindingHorizontalStacks.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            initialsLabel.widthAnchor.constraint(equalToConstant: 88),
            initialsLabel.heightAnchor.constraint(equalToConstant: 88),
            initialsLabel.topAnchor.constraint(equalTo: HStackBindingHorizontalStacks.topAnchor, constant: 16),
            initialsLabel.trailingAnchor.constraint(equalTo: divider.leadingAnchor, constant: -32),
            initialsLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -16),
            initialsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(equalTo: divider.leadingAnchor, constant: -16),

            HStackalbumsPosts.topAnchor.constraint(equalTo: HStackBindingHorizontalStacks.bottomAnchor),
            HStackalbumsPosts.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            HStackalbumsPosts.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            HStackalbumsPosts.heightAnchor.constraint(equalToConstant: 48),
            
            divider.heightAnchor.constraint(equalToConstant: 157.5),
            divider.widthAnchor.constraint(equalToConstant: 2),
            divider.topAnchor.constraint(equalTo: HStackBindingHorizontalStacks.topAnchor, constant: -2),
            divider.trailingAnchor.constraint(equalTo: VStackUserEmailPhoto.leadingAnchor, constant: -16),
            divider.bottomAnchor.constraint(equalTo: HStackalbumsPosts.topAnchor, constant: -8),

            VStackUserEmailPhoto.bottomAnchor.constraint(equalTo: HStackalbumsPosts.topAnchor, constant: -32),
            VStackUserEmailPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),

        ])
    }
    
    func setupUIConfiguration(){

        initialsLabel.textAlignment = .center
        initialsLabel.backgroundColor = .systemYellow
        
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        
        divider.backgroundColor = .lightGray
        
        VStackInitialsName.distribution = .fill
        VStackInitialsName.axis = .vertical
        
        usernameLabel.textAlignment = .left
        emailLabel.textAlignment = .left
        phoneLabel.textAlignment = .left
        
        VStackUserEmailPhoto.distribution = .fillEqually
        VStackUserEmailPhoto.axis = .vertical
        VStackUserEmailPhoto.spacing = 24
        
        HStackBindingHorizontalStacks.distribution = .fillProportionally
        HStackBindingHorizontalStacks.axis = .horizontal
        HStackBindingHorizontalStacks.spacing = 2
        
        albumsButton.contentHorizontalAlignment = .center
        albumsButton.setTitle(ConstantsStrings.albumsButtonTitle, for: .normal)
        albumsButton.setTitleColor(.systemOrange, for: .normal)
        
        postsButton.contentHorizontalAlignment = .center
        postsButton.setTitle(ConstantsStrings.postsButtonTitle, for: .normal)
        postsButton.setTitleColor(.systemOrange, for: .normal)
        
        HStackalbumsPosts.distribution = .fillEqually
        HStackalbumsPosts.axis = .horizontal
        HStackalbumsPosts.spacing = 2
        
        albumsButton.addTarget(self, action: #selector(albumsActionPressed), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(postsActionPressed), for: .touchUpInside)
    }
    
    func addSubViews(){
        
       contentView.addSubview(initialsLabel)
       contentView.addSubview(nameLabel)
       contentView.addSubview(VStackInitialsName)
        
        VStackInitialsName.addArrangedSubview(initialsLabel)
        VStackInitialsName.addArrangedSubview(nameLabel)
        
        
       contentView.addSubview(usernameLabel)
       contentView.addSubview(emailLabel)
       contentView.addSubview(phoneLabel)
       contentView.addSubview(VStackUserEmailPhoto)
        
        VStackUserEmailPhoto.addArrangedSubview(usernameLabel)
        VStackUserEmailPhoto.addArrangedSubview(emailLabel)
        VStackUserEmailPhoto.addArrangedSubview(phoneLabel)
        
       contentView.addSubview(HStackBindingHorizontalStacks)
        
        HStackBindingHorizontalStacks.addArrangedSubview(VStackInitialsName)
        HStackBindingHorizontalStacks.addArrangedSubview(divider)
        HStackBindingHorizontalStacks.addArrangedSubview(VStackUserEmailPhoto)
        
       contentView.addSubview(albumsButton)
       contentView.addSubview(postsButton)
       contentView.addSubview(HStackalbumsPosts)
        
        HStackalbumsPosts.addArrangedSubview(albumsButton)
        HStackalbumsPosts.addArrangedSubview(postsButton)
    }
    
    @objc func albumsActionPressed() {
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @objc func postsActionPressed() {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func albumsAction(_ sender: UIButton) {
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @IBAction func postsAction(_ sender: UIButton) {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
}

import UIKit


final class PhotoTableViewCell: UITableViewCell, ViewCode {
    
    
    @TemplateView var photoImageView: UIImageView
    @TemplateView var titleLabel: UILabel
    @TemplateView var stackPhotoView: UIStackView
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupView(){
        addSubViews()
        setupUIConfiguration()
        setupContraints()
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([
            
            stackPhotoView.heightAnchor.constraint(equalToConstant: 166), //150(photo) + 16(top+bottom)
            
            stackPhotoView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            stackPhotoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackPhotoView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            stackPhotoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackPhotoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    func setupUIConfiguration(){
        
        titleLabel.contentMode = .left
        titleLabel.font = UIFont(name: "System", size: 17.0)
        titleLabel.numberOfLines = 0
        
        photoImageView.contentMode = .scaleAspectFit
        
        stackPhotoView.axis = .horizontal
        stackPhotoView.spacing = 16
        
    }
    
    func addSubViews(){
        contentView.addSubview(photoImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(stackPhotoView)
        
        self.stackPhotoView.addArrangedSubview(photoImageView)
        self.stackPhotoView.addArrangedSubview(titleLabel)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

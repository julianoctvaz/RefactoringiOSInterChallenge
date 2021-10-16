import UIKit
import Foundation

final class TitleAndDescriptionTableViewCell: UITableViewCell {
    
    @TemplateView var descriptionLabel:UILabel
    @TemplateView var titleLabel: UILabel    
    
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
            
            
            titleLabel.bottomAnchor.constraint(equalTo:  descriptionLabel.topAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,  constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                  
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,  constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    func setupUIConfiguration(){
        titleLabel.contentMode = .left
        titleLabel.font = UIFont.systemFont(ofSize: 21)
        titleLabel.numberOfLines = 0
        
        descriptionLabel.contentMode = .left
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0
    }
    
    func addSubViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

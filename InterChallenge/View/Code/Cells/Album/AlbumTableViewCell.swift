import UIKit

final class AlbumTableViewCell: UITableViewCell {

    @TemplateView var albumNameLabel: UILabel
    
  
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
            
            albumNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            albumNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            albumNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            albumNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func setupUIConfiguration(){
        
        self.albumNameLabel.numberOfLines = 0 //verificar os self
        
    }
    
    func addSubViews(){
        contentView.addSubview(albumNameLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) { //verificar aqui e pohototableVC
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

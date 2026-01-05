import UIKit

class MessageCell: UICollectionViewCell {
    static let reuseIdentifier = "reuseIdentifier"
    
    // table view
    lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        
        setupConstr()
    }
    
    private func setupConstr() {
        NSLayoutConstraint.activate([
            // constraint imageView
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            // constraint textLabel
            textLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
    func setupCell(item: CollectionItem){
        imageView.image = UIImage(named: item.image)
        textLabel.text = item.text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import UIKit

class DetailsCell: UITableViewCell {
    
    private lazy var avatarView = createImageView()
    private lazy var nameView = createUserName()
    private lazy var contentImageView = createImageCell()
    private lazy var descriptionLabel = createDescriptionLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: TableDataCell) {
        avatarView.image = UIImage(named: item.avatar)
        nameView.text = item.userName
        contentImageView.image = UIImage(named: item.cellImage)
        descriptionLabel.text = item.description
    }
    
    private func setupLayout() {
        contentView.addSubview(avatarView)
        contentView.addSubview(nameView)
        contentView.addSubview(contentImageView)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            // constraint avatarView
            avatarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            avatarView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // constraint nameView
            nameView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 15),
            nameView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameView.heightAnchor.constraint(equalToConstant: 19),
            
            // constraint contentImageView
            contentImageView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 42),
            contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentImageView.heightAnchor.constraint(equalToConstant: 260),
            
            // constraint descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 34),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func createUserName() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .clear
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }
    
    private func createImageCell() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 21
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }
}

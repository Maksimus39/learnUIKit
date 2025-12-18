import UIKit

class ItemCustomCell: UITableViewCell {
    
    lazy var avatarView = createImageView()
    lazy var nameView = createUserName()
    lazy var contentImageView = createImageCell()
    lazy var dateLabel = createDateLabel()
    lazy var descriptionLabel = createDescriptionLabel()
    
    lazy var container = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 21
        return $0
    }(UIView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.addSubview(container)
        
        container.addSubview(avatarView)
        container.addSubview(nameView)
        container.addSubview(dateLabel)
        container.addSubview(contentImageView)
        container.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            // constraints container
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            
            // constraints avatarView
            avatarView.topAnchor.constraint(equalTo: container.topAnchor, constant: 14),
            avatarView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            avatarView.widthAnchor.constraint(equalToConstant: 35),
            avatarView.heightAnchor.constraint(equalToConstant: 35),
            
            // constraints nameView
            nameView.topAnchor.constraint(equalTo: container.topAnchor, constant: 22),
            nameView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 8),
            nameView.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -10),
            
            // constraints contentImageView
            contentImageView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 19),
            contentImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            contentImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            contentImageView.heightAnchor.constraint(equalToConstant: 174),
            
            // constraints dateLabel
            dateLabel.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
            dateLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            
            // constraints descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 14),
            descriptionLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            descriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            descriptionLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
    }
    
    func configure(data item: TableDataCell) {
        avatarView.image = UIImage(named: item.avatar)
        nameView.text = item.userName
        contentImageView.image = UIImage(named: item.cellImage)
        dateLabel.text = item.formattedDate
        descriptionLabel.text = item.description
    }
    
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 17.5
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func createUserName() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }
    
    private func createDateLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }
    
    private func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

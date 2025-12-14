import UIKit

class ItemCell: UITableViewCell {
    lazy var cellView: UIView = {
        $0.backgroundColor = .lightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        return $0
    }(UIView())
    
    lazy var titleLabel: UILabel = {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 21, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var contentLabel: UILabel = {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var cellImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Только раз настраиваем вьюхи
    private func setupViews() {
        contentView.addSubview(cellView)
        cellView.addSubview(cellImageView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(contentLabel)
    }
    
    // Только раз настраиваем констрейнты
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // constraint cellView
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            // constraint cellImageView
            cellImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            cellImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            cellImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellImageView.heightAnchor.constraint(equalToConstant: 200),
        
            // constraint titleLabel
            titleLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),

            // constraint contentLabel
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            contentLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10)
        ])
    }
    // Этот метод вызывается каждый раз при обновлении ячейки
    func configure(with item: TableData) {
        titleLabel.text = item.title
        contentLabel.text = item.description
        cellImageView.image = UIImage(named: item.image)
    }
}

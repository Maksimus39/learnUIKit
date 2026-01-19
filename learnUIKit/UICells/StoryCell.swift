import UIKit

class StoryCell: UICollectionViewCell {
    static let reuseIdentifier = "StoryCellReuseIdentifier"
    
    lazy var cellImage: UIImageView = {
        $0.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 80)
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var nameLabel: UILabel = {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.frame = CGRect(x: 0, y: cellImage.frame.maxY + 2, width: bounds.width,  height: 20)
        $0.font = .systemFont(ofSize: 12)
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.addSubview(cellImage)
        contentView.addSubview(nameLabel)
    }
    
    func configCell(for cell: CollectionItemCompositionLayoutModel){
        self.cellImage.image = UIImage(named: cell.image)
        self.nameLabel.text = cell.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MessageCell: UICollectionViewCell {
    static let reuseIdentifier = "MessageCellReuseIdentifier"
    
    lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "CellMessageColor")
        contentView.layer.cornerRadius = 20
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
    
    func setupCell(item: CollectionItemCompositionLayoutModel){
        imageView.image = UIImage(named: item.image)
        textLabel.text = item.text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NewsCell: UICollectionViewCell {
    static let reuseIdentifier = "NewsCellReuseIdentifier"
    
    lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var headerTextLabel = createText(size: 24, weight: .bold)
    lazy var descriptionTextLabel = createText(size: 14, weight: .regular)
    
    private func createText(size: Int, weight: UIFont.Weight) -> UILabel {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        text.textAlignment = .left
        return text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(headerTextLabel)
        contentView.addSubview(descriptionTextLabel)
        
        createConstraintNewsCell()
    }
    
    private func createConstraintNewsCell() {
        NSLayoutConstraint.activate([
            // constraint imageView
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // constraint textLabel
            headerTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            headerTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headerTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            headerTextLabel.heightAnchor.constraint(equalToConstant: 29),
            
            // constraint descriptionTextLabel
            descriptionTextLabel.topAnchor.constraint(equalTo: headerTextLabel.bottomAnchor, constant: 16),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionTextLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -24)
        ])
    }
    
    func setupCell(item: CollectionItemCompositionLayoutModel){
        imageView.image = UIImage(named: item.image)
        headerTextLabel.text = item.header
        descriptionTextLabel.text = item.text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class BannerCell: UICollectionViewCell {
    static let reuseIdentifier = "BannerCellReuseIdentifier"
    
    var originSize: CGAffineTransform?
    
    lazy var imageView: UIImageView = {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapGestFunc)) // реализация жеста
        let pinchGest = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestFunc)) // реализация жеста
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true // <- жест
        
        $0.addGestureRecognizer(tapGest)   // добавил жест
        $0.addGestureRecognizer(pinchGest)   // добавил жест
        self.originSize = $0.transform
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        createConstraintNewsCell()
    }
    
    private func createConstraintNewsCell() {
        // constraint imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func bunnerSetupCell(item: CollectionItemCompositionLayoutModel) {
        imageView.image = UIImage(named: item.image)
    }
    
    // функция реализации жеста
    @objc func tapGestFunc() {
        print("tap")
    }
    
    @objc func pinchGestFunc(gest: UIPinchGestureRecognizer) {
        guard let gestView = gest.view else { return }
        
        if gest.state == .began {
           
            if let contentView = gestView.superview,
               let cell = contentView.superview as? BannerCell,
               let collectionView = cell.superview as? UICollectionView {
                
                collectionView.bringSubviewToFront(cell)
                
                cell.layer.zPosition = 9999
              
                cell.contentView.bringSubviewToFront(gestView)
                gestView.layer.zPosition = 10000
            }
        }
        
        gestView.transform = gestView.transform.scaledBy(x: gest.scale, y: gest.scale)
        
        if gest.state == .ended {
            UIView.animate(withDuration: 0.2) {
                gestView.transform = self.originSize ?? .init(scaleX: 1, y: 1)
            } completion: { _ in
                // Сбрасываем позиции
                if let contentView = gestView.superview,
                   let cell = contentView.superview as? BannerCell {
                    cell.layer.zPosition = 0
                    gestView.layer.zPosition = 0
                }
            }
        }
        gest.scale = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PhotoCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoCellReuseIdentifier"
    
    let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Biography: UICollectionViewCell {
    static let reuseIdentifier = "BioCellReuseIdentifier"
    
    let textView: UITextView = {
        $0.isEditable = false
        $0.font = UIFont.systemFont(ofSize: 19)
        $0.isScrollEnabled = false
        $0.backgroundColor = .clear
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


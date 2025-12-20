import UIKit

class CollectionCell: UICollectionViewCell {
    
    static let cellIdentifier = "CollectionCell"
    
    lazy var imageView: UIImageView = {
        $0.frame = CGRect(x: 10, y: 15, width: bounds.width - 20, height: 90)
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    lazy var titleLabel: UILabel = {
        $0.frame = CGRect(x: 10, y: imageView.frame.maxY + 10, width: bounds.width - 20, height: 16)
        $0.numberOfLines = 1
        $0.text = "Title"
        return $0
    }(UILabel())
    
    lazy var contentText: UILabel = {
        $0.frame = CGRect(x: 10, y: titleLabel.frame.maxY + 5, width: bounds.width - 20, height: bounds.height - (90 + 40))
        $0.numberOfLines = 2
        $0.text = """
            qwertyuiop[]';lkjhgfdsazxcvbnm,.
            """
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(bounds)
        contentView.backgroundColor = .cyan
        contentView.layer.cornerRadius = 10
    }
    
    func setupCell(item: TableDataCell){
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentText)
        
        imageView.image = UIImage(named: item.avatar)
        titleLabel.text = item.userName
        contentText.text = item.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

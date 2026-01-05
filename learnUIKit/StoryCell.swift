import UIKit


class StoryCell: UICollectionViewCell {
    static let reuseIdentifier = "StoryCell"
    
    lazy var cellImage: UIImageView = {
        $0.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 80)
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var nameLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.frame = CGRect(x: 0, y: 90, width: cellImage.frame.maxY + 2, height: 20)
        $0.font = .systemFont(ofSize: 12) // Уменьшили шрифт
        $0.numberOfLines = 2 // Разрешаем 2 строки
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(cellImage)
        contentView.addSubview(nameLabel)
    }
    
    func configCell(for cell: CollectionItem){
        self.cellImage.image = UIImage(named: cell.image)
        self.nameLabel.text = cell.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

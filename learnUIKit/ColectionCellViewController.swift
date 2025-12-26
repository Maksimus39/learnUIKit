import UIKit

class CollectionCellViewController: UICollectionViewCell {
    
    static let cellID = UUID()
    var completion: (() -> Void)?
    
    private var currentItem: TableItem?
    
    lazy var imageView = imageRender(x: 6, y: 6, width: Int(CGFloat(bounds.width - 12)), height: Int(CGFloat(bounds.height - 116)), radius: 10)
    lazy var imageViewLogo = imageRender(x: 10, y: 112, width: 17, height: 17, radius: 8)
    
    lazy var titleLabel = renderText(x: 32, y: 113, width: Int(bounds.width - 38), height: 15, font: 12, bold: true)
    lazy var contentText = renderText(x: 10, y: 136, width: Int(bounds.width - 16), height: 30, font: 12, bold: false)
    
    lazy var buttonDetailsCell: UIButton = {
        $0.frame = CGRect(x: 6, y: 180, width: bounds.width - 12, height: 30)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(named: "ButtonDetailsSet")
        $0.setTitle("Подробнее", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.textAlignment = .center
        return $0
    }(UIButton(primaryAction: UIAction(handler: { [weak self] _ in
        self?.completion?()
    })))
        override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "CellColorSet")
        contentView.layer.cornerRadius = 10
    }
    
    func setupCell(item: TableItem) {
        self.currentItem = item
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentText)
        contentView.addSubview(imageViewLogo)
        contentView.addSubview(buttonDetailsCell)
        
        imageView.image = UIImage(named: item.cardImage)
        titleLabel.text = item.name
        contentText.text = item.discription
        imageViewLogo.image = UIImage(named: item.detailCellImage)
    }
    
    private func imageRender(x: Int, y: Int, width: Int, height: Int, radius: Int) -> UIImageView {
        let img = UIImageView()
        img.frame = CGRect(x: x, y: y, width: width, height: height)
        img.clipsToBounds = true
        img.layer.cornerRadius = CGFloat(radius)
        img.contentMode = .scaleToFill
        return img
    }
    
    private func renderText(x: Int, y: Int, width: Int, height: Int, font: Int, bold: Bool = false) -> UILabel {
        let text = UILabel()
        text.frame = CGRect(x: x, y: y, width: width, height: height)
        text.font = bold ? UIFont.boldSystemFont(ofSize: CGFloat(font)) : UIFont.systemFont(ofSize: CGFloat(font))
        text.numberOfLines = 2
        text.lineBreakMode = .byWordWrapping
        return text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

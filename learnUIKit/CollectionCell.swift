import UIKit

class CollectionCell: UICollectionViewCell {
    
    static let cellID = UUID()
    
    lazy var banner: UIImageView = {
        $0.backgroundColor = .lightGray
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var contentLabel: UILabel = {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var navigationButton: UIButton = {
        $0.setTitle("Go to detail", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: UIAction(handler:{ [weak self] _ in
        
    })))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .lightGray
        
        contentView.addSubview(banner)
        contentView.addSubview(contentLabel)
        contentView.addSubview(navigationButton)
    }
    
    func setupCell(item: TableItem){
        banner.image = UIImage(named: item.detailCellImage)
        contentLabel.text = item.discription
        
        setConstraints()
    }
    
    override func prepareForReuse() {
        // clear cell
        banner.image = nil
        contentLabel.text = nil
        
        // 2
        banner.constraints.forEach{const in
            banner.removeConstraint(const)
        }
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            // width - 20
            // constraint banner
            banner.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            // этим я регулирую размер ширины экрана
            banner.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            banner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            banner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
           
            // add height anchor
            
            // constraint contentLabel
            contentLabel.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // constraint navigationButton
            navigationButton.heightAnchor.constraint(equalToConstant: 50),
            navigationButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10),
            navigationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            navigationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            navigationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
    func getRatio() -> Double {
        self.size.height / self.size.width
    }
}

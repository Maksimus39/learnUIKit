import UIKit

class CellViewController: BaseViewController {
    var item: TableItem?
    
    private lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UIScrollView())
    
    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    lazy var imgView = createImageCell(radius: 10)
    lazy var detailsImgView = detailsImgViewCell(radius: 21)
    lazy var cellNameView = createCellNameView(textSize: 16, text: item?.name ?? "item?.name")
    lazy var cellDescription = createCellNameView(textSize: 12, text: item?.discription ?? "item?.discription")
    
    init(item: TableItem?) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.item = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = item?.name
        navigationItem.largeTitleDisplayMode = .never
        cellSetupLayout()
    }
    
    private func cellSetupLayout(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imgView)
        contentView.addSubview(detailsImgView)
        contentView.addSubview(cellNameView)
        contentView.addSubview(cellDescription)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            // constraint imgView
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 52),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imgView.heightAnchor.constraint(equalToConstant: 247),
            
            // constraint detailsImgView
            detailsImgView.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 24),
            detailsImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
            detailsImgView.heightAnchor.constraint(equalToConstant: 42),
            
            // constraint cellNameView
            cellNameView.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 37),
            cellNameView.leadingAnchor.constraint(equalTo: detailsImgView.trailingAnchor, constant: 8),
            cellNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellNameView.heightAnchor.constraint(equalToConstant: 19),
            
            // constraint cellDescription
            cellDescription.topAnchor.constraint(equalTo: detailsImgView.bottomAnchor, constant: 18),
            cellDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func createImageCell(radius: Int) -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = CGFloat(radius)
        img.image = UIImage(named: item?.cardImage ?? "cardImage")
        return img
    }
    
    private func detailsImgViewCell(radius: Int) -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: 42).isActive = true
        img.heightAnchor.constraint(equalToConstant: 42).isActive = true
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = CGFloat(radius)
        img.image = UIImage(named: item?.detailCellImage ?? "detailCellImage")
        return img
    }
    
    private func createCellNameView(textSize: CGFloat ,text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: textSize, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .clear
        label.text = text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }
}

import UIKit

class ColectionCellViewController: UICollectionViewCell {
    
    static var cellID = UUID()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(frame)
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import UIKit

class GameCellViewController: UICollectionViewCell {

    static let gameCellReuseIdentifier = UUID()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

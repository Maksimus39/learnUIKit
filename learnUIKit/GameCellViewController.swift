import UIKit

class GameCellViewController: UICollectionViewCell {
    
    static let gameCellReuseIdentifier = "GameCellViewController"
    
    lazy var titleGameCell = createText(ofSize: 20, weight: .bold)
    lazy var headingGameCell = createText(ofSize: 20, weight: .bold)
    lazy var dateReleaseGameCell = createText(ofSize: 12, weight: .regular)
    lazy var descriptionGameCell = createText(ofSize: 16, weight: .regular, num: 0)
    
    lazy var imageGameCell: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        return $0
    }(UIImageView())
    
    lazy var buttonGameCell: UIButton = {
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(named: "CellGameButtonColor")
        $0.setTitle("next", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.textAlignment = .center
        return $0
    }(UIButton(primaryAction: UIAction(handler: { [weak self] _ in
        print("--->>> CLICK GAME CELL --->>>")
    })))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "CellGameColor")
        contentView.layer.cornerRadius = 30
        contentView.addSubview(titleGameCell)
        contentView.addSubview(imageGameCell)
        contentView.addSubview(headingGameCell)
        contentView.addSubview(dateReleaseGameCell)
        contentView.addSubview(descriptionGameCell)
        contentView.addSubview(buttonGameCell)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleGameCell.text = nil
        imageGameCell.image = nil
        headingGameCell.text = nil
        dateReleaseGameCell.text = nil
        descriptionGameCell.text = nil
    }
    
    func configure(with game: GameItem) {
        titleGameCell.text = game.titleGame
        imageGameCell.image = UIImage(named: game.imageGame)
        headingGameCell.text = game.titleDescription
        dateReleaseGameCell.text = game.dateRelease
        descriptionGameCell.text = game.description
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            // constraint imageGameCell
            imageGameCell.topAnchor.constraint(equalTo: titleGameCell.bottomAnchor, constant: 21),
            imageGameCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageGameCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageGameCell.heightAnchor.constraint(equalToConstant: 266),
            imageGameCell.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            
            // constraint titleGameCell
            titleGameCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            titleGameCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            titleGameCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),
            titleGameCell.heightAnchor.constraint(equalToConstant: 24),
            
            // constraint headingGameCell
            headingGameCell.topAnchor.constraint(equalTo: imageGameCell.bottomAnchor, constant: 9),
            headingGameCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            headingGameCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),
            headingGameCell.heightAnchor.constraint(equalToConstant: 24),
            
            // constraint dateReleaseGameCell
            dateReleaseGameCell.topAnchor.constraint(equalTo: headingGameCell.bottomAnchor, constant: 3),
            dateReleaseGameCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            dateReleaseGameCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),
            dateReleaseGameCell.heightAnchor.constraint(equalToConstant: 15),
            
            // constraint descriptionGameCell
            descriptionGameCell.topAnchor.constraint(equalTo: dateReleaseGameCell.bottomAnchor, constant: 14),
            descriptionGameCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionGameCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionGameCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -108),
            
            // constraint buttonGameCell
            buttonGameCell.topAnchor.constraint(equalTo: descriptionGameCell.bottomAnchor, constant: 38),
            buttonGameCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            buttonGameCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            buttonGameCell.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createText(ofSize: CGFloat, weight: UIFont.Weight, num: Int = 0) -> UILabel {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = .systemFont(ofSize: ofSize, weight: weight)
        txt.textColor = .black
        txt.backgroundColor = .clear
        txt.numberOfLines = num
        return txt
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import UIKit

class GameCustomCellViewController: UIViewController {
    
    private let gameCellItems: [GameItem]
    
    init(gameCellItems: [GameItem]) {
        self.gameCellItems = gameCellItems
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var gameLayout: UICollectionViewFlowLayout = {
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 38
       return $0
    }(UICollectionViewFlowLayout())
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(GameCellViewController.self, forCellWithReuseIdentifier: GameCellViewController.gameCellReuseIdentifier.uuidString)
        $0.backgroundColor = .white
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: gameLayout))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        print(gameCellItems)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameCustomCellViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameCellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCellViewController.gameCellReuseIdentifier.uuidString, for: indexPath)
        
        return gameCell
    }
}

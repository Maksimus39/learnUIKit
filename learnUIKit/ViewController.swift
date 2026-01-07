import UIKit

class ViewController: UIViewController {
    
    private let coreAppDataItem = CoreAppData.mockAppData()
    
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseIdentifier)
        $0.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseIdentifier)
        $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseIdentifier)
        $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseIdentifier)
        $0.backgroundColor = .clear
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: CompositionalLayoutFactory.createLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.05, green: 0.30, blue: 0.58, alpha: 1.0)
        
        view.addSubview(collectionView)
    }
}


extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        coreAppDataItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coreAppDataItem[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = coreAppDataItem[indexPath.section].items[indexPath.row]
        
        switch indexPath.section {
        case 0:
            let cellStory = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.reuseIdentifier, for: indexPath) as! StoryCell
            cellStory.configCell(for: item)
            return cellStory
        case 1:
            let cellMessage = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.reuseIdentifier, for: indexPath) as! MessageCell
            cellMessage.setupCell(item: item)
            return cellMessage
        case 2:
            let cellNews = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseIdentifier, for: indexPath) as! NewsCell
            cellNews.setupCell(item: item)
            return cellNews
        case 3:
            let cellBunner = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseIdentifier, for: indexPath) as! BannerCell
            cellBunner.bunnerSetupCell(item: item)
            return cellBunner
        default:
            fatalError("Unhandled section")
        }
    }
}

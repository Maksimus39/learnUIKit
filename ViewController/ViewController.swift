import UIKit

class ViewController: UIViewController {
    
    private let coreAppDataItem = CoreAppData.mockAppData()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayoutFactory.createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseIdentifier)
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseIdentifier)
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseIdentifier)
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "RootColor")
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = coreAppDataItem[indexPath.section].items[indexPath.row]
        
        switch indexPath.section {
        case 0:
            let actorName = item.name
            let photoActor = item.details?.photos
            let biographyActor = item.details?.biography
            
            let actorDetailsVC = ActorDetailsViewController(
                actorName: actorName,
                actorPhotos: photoActor,
                actorBiography: biographyActor
            )
            showDetailsViewController(in: 1, with: actorDetailsVC)
            
        case 2:
            let moveDetails = item.detailsMove?.text
            let moveDetailsVC = MoveDetailsViewController(moveDetails: moveDetails)
            showDetailsViewController(in: 2, with: moveDetailsVC)
        default:
            break
        }
    }
    
    private func showDetailsViewController<T>(
        in tabIndex: Int,
        with viewController: T,
        animated: Bool = true
    ) where T: UIViewController {
        
        guard let tabBarController = self.tabBarController,
              let navController = tabBarController.viewControllers?[tabIndex] as? UINavigationController else {
            return
        }
        
        navController.setViewControllers([viewController], animated: animated)
        tabBarController.selectedIndex = tabIndex
    }
}



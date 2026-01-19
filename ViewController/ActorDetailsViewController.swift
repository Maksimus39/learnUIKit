import UIKit

class ActorDetailsViewController: UIViewController {
    
    private var actorName: String?
    private var actorPhotos: [String]?
    private var actorBiography: String?
    
    private let backgroundImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "img16")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var collectionViewActorDetails: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        collectionView.register(Biography.self, forCellWithReuseIdentifier: Biography.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(actorName: String? = nil, actorPhotos: [String]? = nil, actorBiography: String? = nil) {
        self.actorName = actorName
        self.actorPhotos = actorPhotos
        self.actorBiography = actorBiography
        super.init(nibName: nil, bundle: nil)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
                return self.createPhotoSection()
            case 1:
                return self.createActorBiographyLayout()
            default:
                return nil
            }
        }
    }
    
    private func createPhotoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .estimated(250)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
   
    
    private func createActorBiographyLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = actorName
        view.addSubview(backgroundImageView)
        view.addSubview(collectionViewActorDetails)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            // constraint backgroundImageView
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // constraint collectionViewActorDetails
            collectionViewActorDetails.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewActorDetails.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewActorDetails.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewActorDetails.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActorDetailsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return actorPhotos?.count ?? 0
        case 1:
            return actorBiography != nil ? 1 : 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
            if let photoName = actorPhotos?[indexPath.item],
               let image = UIImage(named: photoName) {
                cell.imageView.image = image
            }
            return cell

        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Biography.reuseIdentifier, for: indexPath) as! Biography
            cell.textView.text = actorBiography
            return cell

        default:
            fatalError("Unexpected section")
        }
    }
}







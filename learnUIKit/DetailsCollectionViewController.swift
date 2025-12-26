import UIKit

class DetailsCollectionViewController: BaseViewController {
    
    private let items: [TableItem]
    private let titleDescription: String
   
    init(items: [TableItem], titleDescription: String) {
        self.items = items
        self.titleDescription = titleDescription
        super.init(nibName: nil, bundle: nil)
    }
   
    lazy var layout: UICollectionViewFlowLayout = {
        $0.itemSize = CGSize(width: (view.frame.width - 57) / 2, height: 216)
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 17
        $0.sectionInset = UIEdgeInsets(top: 50, left: 20, bottom: 10, right: 20)
        return $0
    }(UICollectionViewFlowLayout())
   
    lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.register(CollectionCellViewController.self, forCellWithReuseIdentifier: CollectionCellViewController.cellID.uuidString)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = titleDescription
        print(items) // <- проверил передачу данных
        view.addSubview(collectionView)
        setupLayout()
    }
   
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCellViewController.cellID.uuidString, for: indexPath) as! CollectionCellViewController
        
        cell.setupCell(item: items[indexPath.item])
        cell.contentView.backgroundColor = UIColor(white: 1, alpha: 0.9)
        cell.layer.cornerRadius = 10
            
        
        cell.completion = { [unowned self]  in
            let detailVC = CellViewController(item: self.items[indexPath.row])
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        return cell
    }
}

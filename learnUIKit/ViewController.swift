import UIKit

class ViewController: UIViewController {
    
    private let cellCoreData = CoreSectionData.mockCoreDataRace()
    
    lazy var layout: UICollectionViewFlowLayout = {
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 10
        //$0.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        return $0
    }(UICollectionViewFlowLayout())
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        view.backgroundColor = .clear
        $0.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.cellID.uuidString)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellCoreData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.cellID.uuidString, for: indexPath) as! CollectionCell
        
        let tableItem = cellCoreData[indexPath.section].item[indexPath.row]
        cell.setupCell(item: tableItem)
        
        return cell
    }
}




import UIKit

struct TableDataCell {
    var titleCustomCell: String = "Карточка для "
    var avatar: String
    var userName: String
    var cellImage:  String
    var description: String
    
    static func mockData() -> [TableDataCell] {
        [
            TableDataCell(avatar: "avatar1",
                          userName: "Ivanov Ivan",
                          cellImage: "img1",
                          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
            TableDataCell(avatar: "avatar2",
                          userName: "Petrov Petya",
                          cellImage: "img2",
                          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
            TableDataCell(avatar: "avatar3",
                          userName: "Sidorov Sidr",
                          cellImage: "img3",
                          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
            TableDataCell(avatar: "avatar1",
                          userName: "Ivanov Ivan",
                          cellImage: "img1",
                          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
            TableDataCell(avatar: "avatar2",
                          userName: "Petrov Petya",
                          cellImage: "img2",
                          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
            TableDataCell(avatar: "avatar3",
                          userName: "Sidorov Sidr",
                          cellImage: "img3",
                          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
        ]
    }
}

class ViewController: UIViewController {
   
    lazy var layout: UICollectionViewFlowLayout = {
        $0.itemSize = CGSize(width: 200, height: 200)
        return $0
    }(UICollectionViewFlowLayout())
    
    lazy var collectionView: UICollectionView = {
        
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

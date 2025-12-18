import UIKit

struct TableDataCell {
    var titleCustomCell: String = "Карточка для "
    var avatar: String
    var userName: String
    var cellImage:  String
    var date = Date()
    var description: String
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
    
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
        ]
    }
}

class ViewController: UIViewController {
    
    lazy var titleCell = "Основной экран"
    
    private let castomDataCell: [TableDataCell] = TableDataCell.mockData()
    
    lazy var tableView: UITableView = {
        $0.register(ItemCustomCell.self, forCellReuseIdentifier: "customCell")
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleCell
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        castomDataCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ItemCustomCell
        let data = castomDataCell[indexPath.row]
        cell.configure(data: data)
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailsViewController(item: castomDataCell[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

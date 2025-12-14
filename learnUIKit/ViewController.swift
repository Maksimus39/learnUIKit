import UIKit


struct TableData {
    var image: String
    var title: String
    var description: String
    
    static func mockData() -> [TableData] {
        [
            TableData(image: "img1", title: "img_1", description: "description_1"),
            TableData(image: "img2", title: "img_2", description: "description_2"),
            TableData(image: "img1", title: "img_3", description: "description_ 3ииорпроп ормормром ормромор мормор"),
            TableData(image: "img2", title: "img_4", description: "description_4 description_ 3ииорпроп ормормром ормромор мормор"),
        ]
    }
}


class ViewController: UIViewController {
    
    // 1 регистрирую данные
    private let tableData = TableData.mockData()
    
    // 2 создаю таблицу
    lazy var tableView: UITableView = {
        $0.register(ItemCell.self, forCellReuseIdentifier: "tableDataCell")
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .plain))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableDataCell", for: indexPath) as! ItemCell
        let item = tableData[indexPath.row]
        cell.configure(with: item) 
        cell.selectionStyle = .none
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableData[indexPath.row])
    }
}


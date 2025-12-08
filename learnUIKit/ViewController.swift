import UIKit

class ViewController: UIViewController {
    
    private let mock = SettingCellTableItem.settingCellTableItemMock()
    
    private lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cellTableView")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mockData = SettingCellTableItem.settingCellTableItemMock()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTableView", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.image = UIImage(systemName: mockData[indexPath.row].icon)
        config.text = mockData[indexPath.row].title
        cell.contentConfiguration = config
        return cell
    }
}

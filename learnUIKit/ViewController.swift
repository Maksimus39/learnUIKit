import UIKit

class ViewController: UIViewController {
    
    private let settings = SettingItem.mockData()
    
    private lazy var tableView: UITableView = {
        // 1 регистрация ячейки
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .opaqueSeparator
        view.addSubview(tableView)
        
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = settings[indexPath.row].title
        config.secondaryText = settings[indexPath.row].sub
        
        config.image = UIImage(systemName: settings[indexPath.row].icon)
        
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Подписки"
        case 1:
            return "Настройки"
        default: return nil
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        print(settings[index])
        print(indexPath)
    }
}

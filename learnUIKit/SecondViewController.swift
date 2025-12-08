import UIKit

class SecondViewController: UIViewController {
    
    private  let secondSettingMock = SecondSettingCellTableItem.secondSettingCellTableItemMock()
    
    private lazy var secondTableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cellSecond")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(secondTableView)
    }
}

extension SecondViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        secondSettingMock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSecond", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.image = UIImage(systemName: secondSettingMock[indexPath.row].icon)
        config.text = secondSettingMock[indexPath.row].title
        
        if indexPath.section == 1 {
            config.secondaryText = secondSettingMock[indexPath.row].someText
        } else {
            config.secondaryText = nil
        }
        
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Users"
        case 1:
            return "groups"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Users footer"
        default:
            return nil
        }
    }
}

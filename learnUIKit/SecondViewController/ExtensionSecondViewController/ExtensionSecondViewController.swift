import UIKit

extension SecondViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SecondSettingCellTableItem.secondSettingCellTableItemMock().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mock = SecondSettingCellTableItem.secondSettingCellTableItemMock()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSecond", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.image = UIImage(systemName: mock[indexPath.row].icon)
        config.text = mock[indexPath.row].title
        
        if indexPath.section == 1 {
            config.secondaryText = mock[indexPath.row].someText
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

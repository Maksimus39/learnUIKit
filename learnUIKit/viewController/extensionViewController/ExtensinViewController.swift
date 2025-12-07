import UIKit

extension ViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingCellTableItem.settingCellTableItemMock().count
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

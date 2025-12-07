import UIKit

class SecondViewController: UIViewController {
    
    private lazy var secondSettingMock = SecondSettingCellTableItem.secondSettingCellTableItemMock()
    
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

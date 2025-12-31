import UIKit

class ViewController: UIViewController {
    
    private lazy var tableData: [ProductViewModel] = ProductViewModel.mockGameData()
    private lazy var titleCornerView: String = ProductViewModel.mockGameData().first?.title ?? "Anthology Gears of War"
    private lazy var iconTitleCornerView: String = ProductViewModel.mockGameData().first?.iconTitle ?? "Погнали смотреть"
    private let gameCellID = UUID().uuidString
    
    private lazy var tableGameView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: gameCellID)
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableGameView)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = titleCornerView
        tableGameView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gameCell = tableView.dequeueReusableCell(withIdentifier: gameCellID, for: indexPath)
        let currentCell = tableData[indexPath.section]
        var config = gameCell.defaultContentConfiguration()
        config.image = UIImage(systemName: currentCell.icon)
        config.text = iconTitleCornerView
        gameCell.backgroundColor = .systemFill
        gameCell.contentConfiguration = config
        
        return gameCell
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        tableData[section].footer
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableData[section].header
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let selectGameSection = tableData[indexPath.section]
        
        let gameVC = GameCustomCellViewController(gameCellItems: selectGameSection.itemGame)
        navigationController?.pushViewController(gameVC, animated: true)
    }
}





import UIKit

class ViewController: BaseViewController {
    
    private lazy var tableRaceData: [CoreSectionData] = CoreSectionData.mockCoreDataRace()
    private lazy var titleCoreView = CoreSectionData.mockCoreDataRace().first?.title ?? "Главный экран"
    private let cellIdentifier = UUID().uuidString
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = titleCoreView
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableRaceData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let currentSectionData = tableRaceData[indexPath.section]
        
        var config = cell.defaultContentConfiguration()
        config.image = UIImage(systemName: currentSectionData.icon)
        cell.contentConfiguration = config
        cell.backgroundColor = .systemFill
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        tableRaceData[section].footer
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableRaceData[section].header
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableRaceData.remove(at: indexPath.section)
            tableView.deleteSections(IndexSet(integer: indexPath.section), with: .bottom)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedSectionData = tableRaceData[indexPath.section]
        
        let vc = DetailsCollectionViewController(items: selectedSectionData.item, titleDescription: selectedSectionData.titleDescription)
        pushViewController(vc)
    }
    
    private func pushViewController(_ viewController: UIViewController){
        guard let navController = navigationController else {
            return
        }
        navController.pushViewController(viewController, animated: true)
    }
}



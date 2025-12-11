import UIKit

enum PageType {
    case details, user, profile
}

struct TableRow {
    let image: String
    let title: String
    let subtitle: String
    var type: PageType = .details
}

// Перенесите TableSection СЮДА — вне ViewController и его extension
struct TableSection {
    var header: String
    var footer: String?
    var items: [TableRow]
    
    static func mockData() -> [TableSection] {
        [
            TableSection(header: "Fruits", footer: nil, items: [
                TableRow(image: "pencil.line", title: "Apple", subtitle: "Red"),
                TableRow(image: "pencil.line", title: "Banana", subtitle: "Yellow", type: .user),
                TableRow(image: "pencil.line", title: "Cherry", subtitle: "Red", type: .details),
            ]),
            
            TableSection(header: "groups", footer: "footer for group - 2", items: [
                TableRow(image: "pencil.line", title: "group - 2", subtitle: "some text"),
                TableRow(image: "pencil.line", title: "group - 2", subtitle: "some text", type: .profile),
                TableRow(image: "pencil.line", title: "group - 2", subtitle: "some text"),
            ])
        ]
    }
}

class ViewController: UIViewController {
    
    // Теперь TableSection доступен здесь
    private var tableData = TableSection.mockData()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(tableView)
        title = "Main VC"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = tableData[indexPath.section].items[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = item.title
        config.secondaryText = item.subtitle
        config.image = UIImage(systemName: item.image)
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableData[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        tableData[section].footer
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableData[indexPath.section].items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemType = tableData[indexPath.section].items[indexPath.row].type
        
        let vc: UIViewController?
        
        switch itemType {
        case .details:
            vc = DetailsViewController(item: tableData[indexPath.section].items[indexPath.row])
        case .user:
            vc = UserViewController()
        case .profile:
            vc = ProfileViewController()
        }
        navigationController?.pushViewController(vc!, animated: true)
    }
}

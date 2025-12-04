import UIKit

class ViewController: UIViewController {
    
    private lazy var users: [String] = [
        "USer-1",
        "USer-2",
        "USer-3",
        "USer-4",
        "USer-5",
        "USer-6",
        "USer-7",
        "USer-8",
    ]
    
    private lazy var tableView: UITableView = {
        // 1 регистрация ячейки
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .opaqueSeparator
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
}

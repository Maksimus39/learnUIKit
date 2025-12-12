// Я не стал выносить дублирование логики каждого вспомогательного контроллера

import UIKit

class ViewController: UIViewController {
    
    private var tableBookData = TableBookData.mockBookData()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.backgroundColor = .lightGray
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "bookTableViewCell")
        $0.delegate = self
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(tableView)
        title = "Общий список"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableBookData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableBookData[section].bookItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookTableViewCell", for: indexPath)
        cell.backgroundColor = .white
        
        let bookItem = tableBookData[indexPath.section].bookItems[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = bookItem.author
        config.secondaryText = bookItem.title
        config.image = UIImage(systemName: bookItem.icon)
        
        cell.contentConfiguration = config
        
        let favoriteImageView = UIImageView(image: bookItem.isFavorite
                                            ? UIImage(systemName: "heart.fill")
                                            : UIImage(systemName: "heart"))
        
        favoriteImageView.tintColor = bookItem.isFavorite
        ? .systemRed
        : .systemGray
        
        cell.accessoryView = favoriteImageView
        
        cell.accessoryType = bookItem.isCompleted
        ? .checkmark
        : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableBookData[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        tableBookData[section].footer
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableBookData[indexPath.section].bookItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let themeBookType = tableBookData[indexPath.section].bookItems[indexPath.row].viewType
        
        
        
        switch themeBookType {
        case .artistic:
            let vc = ArtisticViewController(bookItem: tableBookData[indexPath.section].bookItems[indexPath.row])
            pushViewController(vc)
        case .technical:
            let vc = TechnicalViewController(bookItem: tableBookData[indexPath.section].bookItems[indexPath.row])
            pushViewController(vc)
        case .personalGrowth:
            let vc = PersonalGrowthViewController(bookItem: tableBookData[indexPath.section].bookItems[indexPath.row])
            pushViewController(vc)
        }
    }
    private func pushViewController(_ viewController: UIViewController) {
        guard let navController = navigationController else {
            print("Navigation controller is not available.")
            return
        }
        navController.pushViewController(viewController, animated: true)
    }
}

struct TableBookData {
    var header: String
    var footer: String?
    var bookItems: [BookItem]
    
    static func mockBookData() -> [TableBookData] {
        [
            TableBookData(header: "Любимые книги", footer: "Рецензии и рейтинги обновляются еженедельно", bookItems: [
                BookItem(
                    author: "Джордж Оруэлл",
                    title: "1984",
                    icon: "book.fill",
                    isFavorite: true,
                    isCompleted: true,
                    viewType: .artistic
                ),
                BookItem(
                    author: "Роберт К. Мартин",
                    title: "Чистый код",
                    icon: "doc.plaintext.fill",
                    isFavorite: true,
                    isCompleted: false,
                    viewType: .technical
                ),
                BookItem(
                    author: "Джеймс Клир",
                    title: "Атомные привычки",
                    icon: "leaf.arrow.circlepath",
                    isFavorite: false,
                    isCompleted: false,
                    viewType: .personalGrowth
                ),
                BookItem(
                    author: "Дж. Р. Р. Толкин",
                    title: "Властелин колец",
                    icon: "figure.walk.motion.trianglebadge.exclamationmark",
                    isFavorite: true,
                    isCompleted: true,
                    viewType: .artistic
                ),
                BookItem(
                    author: "Михаил Булгаков",
                    title: "Мастер и Маргарита",
                    icon: "moon.fill",
                    isFavorite: true,
                    isCompleted: false,
                    viewType: .artistic
                ),
            ]),
            
            TableBookData(header: "В процессе", footer: "Обновляется автоматически", bookItems: [
                BookItem(
                    author: "Стивен Кови",
                    title: "7 навыков высокоэффективных людей",
                    icon: "person.crop.circle.badge.checkmark",
                    isFavorite: false,
                    isCompleted: false,
                    viewType: .personalGrowth
                ),
                BookItem(
                    author: "Александр Дюма",
                    title: "Граф Монте-Кристо",
                    icon: "figure.arms.open",
                    isFavorite: true,
                    isCompleted: false,
                    viewType: .artistic
                ),
                BookItem(
                    author: "Карл Саган",
                    title: "Космос",
                    icon: "sun.max.fill",
                    isFavorite: true,
                    isCompleted: false,
                    viewType: .technical
                ),
            ])
        ]
    }
}

enum TypesViewController {
    case artistic, technical, personalGrowth
}

struct BookItem {
    let author: String
    let title: String
    let icon: String
    let isFavorite: Bool
    let isCompleted: Bool
    let viewType: TypesViewController
}

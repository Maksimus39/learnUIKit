import UIKit

class ArtisticViewController: UIViewController {
    private let bookItem: BookItem
    private var label: UILabel!
    
    init(bookItem: BookItem) {
        self.bookItem = bookItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Художественная"
        
        setupLayout()
    }
    
    private func setupLayout() {
        label = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = bookItem.title
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            $0.textColor = .brown
            $0.numberOfLines = 0
            return $0
        }(UILabel())

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    deinit {
        print("ArtisticViewController deinit")
    }
}

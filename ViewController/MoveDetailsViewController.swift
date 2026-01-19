import UIKit

class MoveDetailsViewController: UIViewController {
    
    var moveDetails: String?
    
    private let backgroundImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "img26")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let textView: UITextView = {
        $0.backgroundColor = .clear
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20)
        $0.isEditable = false
        $0.isScrollEnabled = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextView())
    
    init(moveDetails: String? = nil) {
        self.moveDetails = moveDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        displayText()
    }
    
    private func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(textView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func displayText() {
        textView.text = moveDetails 
    }
}

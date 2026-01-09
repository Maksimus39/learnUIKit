import UIKit

class ViewController: UIViewController {
    
    private let images: [UIImage] = [.img1, .img2, .img3]
    
    lazy var stackView: UIStackView = {
        //$0.backgroundColor = .brown
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 10
        
        return $0
    }(UIStackView())
    
    lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.addSubview(scrollViewContent)
        return $0
    }(UIScrollView())
    
    lazy var scrollViewContent: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        //$0.backgroundColor = .yellow
        $0.contentMode = .scaleAspectFit
        $0.image = .img1
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        view.addSubview(scrollView)
        view.backgroundColor = .white
        
        images.forEach { img in
            let img = SomeImage(image: img)
            stackView.addArrangedSubview(img)
        }
        
        NSLayoutConstraint.activate([
            // constraint stackView
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            // constraint scrollView
            scrollView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            // constraint scrollViewContent
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.heightAnchor.constraint(equalToConstant: 1200),
            scrollViewContent.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

class SomeImage: UIImageView {
    init(image: UIImage) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius  = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


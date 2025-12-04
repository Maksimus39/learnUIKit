import UIKit

class InfoViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var overviewLabel = createLabel(text: "Overview", fontSize: 18, weight: UIFont.Weight(rawValue: 700), textColor: .black)
    private lazy var greenlandTitleLabel = createLabel(text: "Greenland", fontSize: 18, weight: UIFont.Weight(rawValue: 700), textColor: .white)
    private lazy var greenlandNorthLabel = createLabel(text: "Greenland, North", fontSize: 12, weight: .regular, textColor: .white)
        
    private lazy var backgroundImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "rootPictureMountainInFog")
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        
        // add shadow
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        
        return $0
    }(UIImageView())
    
    private lazy var backAction: UIAction = UIAction { [weak self] _ in
        self?.navigationController?.popViewController(animated: true)
    }
    
    private lazy var backButtonContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 21.5
        $0.clipsToBounds = true
        return $0
    }(UIView())
    
    private lazy var backButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "rootChevronRight"), for: .normal)
        $0.tintColor = .black
        $0.transform = CGAffineTransform(rotationAngle: .pi)
        return $0
    }(UIButton(primaryAction: backAction))
    
    private lazy var heartButtonContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIView())
    
    private lazy var heartImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "rootHeart")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var contentTextLabel: UILabel = {
        $0.text = """
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
              """
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = UIColor(named: "rootViewColor")
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var bookNowButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        $0.titleLabel?.textColor = UIColor(named: "rootSearchInput")
        $0.backgroundColor = .rootButton
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton())
    
    private lazy var bookNowLabel: UILabel = {
        $0.text = "Book Now"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = UIColor(named: "rootSearchInput")
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupLayout() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(backButtonContainer)
        backgroundImage.addSubview(greenlandTitleLabel)
        backgroundImage.addSubview(greenlandNorthLabel)
        backgroundImage.addSubview(heartButtonContainer)
        backgroundImage.addSubview(heartImageView)
        backButtonContainer.addSubview(backButton)
        view.addSubview(overviewLabel)
        view.addSubview(contentTextLabel)
        view.addSubview(bookNowButton)
        bookNowButton.addSubview(bookNowLabel)
    }
    
    // MARK: - Factory Methods
    private func createLabel(text: String, fontSize: Int, weight: UIFont.Weight, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: CGFloat(fontSize), weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // constraint shadowContainerView
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 82),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backgroundImage.heightAnchor.constraint(equalToConstant: 304),
                        
            // constraint backButtonContainer
            backButtonContainer.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 15),
            backButtonContainer.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 14),
            backButtonContainer.widthAnchor.constraint(equalToConstant: 44),
            backButtonContainer.heightAnchor.constraint(equalToConstant: 44),
            
            // constraint backButton
            backButton.centerXAnchor.constraint(equalTo: backButtonContainer.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: backButtonContainer.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            
            // constraint greenlandTitleLabel
            greenlandTitleLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 234),
            greenlandTitleLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 14),
            greenlandTitleLabel.widthAnchor.constraint(equalToConstant: 130),
            greenlandTitleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            // constraint greenlandNorthLabel
            greenlandNorthLabel.topAnchor.constraint(equalTo: greenlandTitleLabel.bottomAnchor, constant: 4),
            greenlandNorthLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 14),
            greenlandNorthLabel.widthAnchor.constraint(equalToConstant: 138),
            greenlandNorthLabel.heightAnchor.constraint(equalToConstant: 15),
            
            // constraint heartButtonContainer
            heartButtonContainer.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 234),
            heartButtonContainer.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -14),
            heartButtonContainer.widthAnchor.constraint(equalToConstant: 44),
            heartButtonContainer.heightAnchor.constraint(equalToConstant: 30),
            
            // constraint heartImageView
            heartImageView.centerXAnchor.constraint(equalTo: heartButtonContainer.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: heartButtonContainer.centerYAnchor),
            heartImageView.widthAnchor.constraint(equalToConstant: 17),
            heartImageView.heightAnchor.constraint(equalToConstant: 17),
            
            // constraint overviewLabel
            overviewLabel.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 26),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            overviewLabel.heightAnchor.constraint(equalToConstant: 22),
            
            // constraint contentTextLabel
            contentTextLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 6),
            contentTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            contentTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            contentTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            contentTextLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            // constraint bookNowButton
            bookNowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bookNowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bookNowButton.heightAnchor.constraint(equalToConstant: 59),
            bookNowButton.topAnchor.constraint(equalTo: contentTextLabel.bottomAnchor, constant: 20),
            bookNowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            // constraint bookNowLabel
            bookNowLabel.centerXAnchor.constraint(equalTo: bookNowButton.centerXAnchor),
            bookNowLabel.centerYAnchor.constraint(equalTo: bookNowButton.centerYAnchor),
        ])
    }
    
    deinit {
        print("InfoViewController deinit")
    }
}

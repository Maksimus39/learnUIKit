import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var welcomeLabel = createLabel(text: "welcome", fontSize: 12, weight: .regular)
    private lazy var usernameLabel = createLabel(text: "Олег", fontSize: 16, weight: UIFont.Weight(rawValue: 700))
    private lazy var searchTextField = createTextField(placeholder: "search your trip ...", fontSize: 14, backgroundColor: "rootSearchInput")
    private lazy var searchButton = createTextField(placeholder: "", fontSize: 16, backgroundColor: "rootButtonColor")
    private lazy var popularTripLabel = createLabel(text: "Popular Trip", fontSize: 18, weight: UIFont.Weight(rawValue: 700))
    private lazy var seeAllLabel = createLabel(text: "see all", fontSize: 12, weight: .regular)
    private lazy var popularCategoryLabel = createLabel(text: "Popular Category", fontSize: 18, weight: UIFont.Weight(rawValue: 700))
    private lazy var seeAllLabelTwo = createLabel(text: "see all", fontSize: 12, weight: .regular)
    private lazy var greenlandTitleLabel = createLabel(text: "Greenland", fontSize: 18, weight: UIFont.Weight(rawValue: 700))
    private lazy var greenlandNorthLabel = createLabel(text: "Greenland, North", fontSize: 12, weight: .regular)
    private lazy var mountainsTitleLabel = createLabel(text: "Mountains", fontSize: 18, weight: UIFont.Weight(rawValue: 700))
    private lazy var greenlandTitleLabelTwo = createLabel(text: "Greenland", fontSize: 12, weight: .regular)
    
    private lazy var navigationAction: UIAction = UIAction { [weak self] _ in
        let infoViewController = InfoViewController()
        self?.navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    private lazy var profileImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "developerPortrait")
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var bellImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "rootBell")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = UIColor(named: "rootBellColor")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var searchIconImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "rootMagnifyingGlass")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = UIColor(named: "rootSearchInput")
        return $0
    }(UIImageView())
    
    private lazy var popularTripContainerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(named: "rootSearchInput")
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = false
        return $0
    }(UIView())
    
    private lazy var heartImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "rootHeart")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var popularCategoryContainerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(named: "rootSearchInput")
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = false
        return $0
    }(UIView())
    
    private lazy var popularTripImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "rootPictureMountainInFog")
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var detailNavigationButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "rootChevronRight"), for: .normal)
        $0.tintColor = .black
        return $0
    }(UIButton(primaryAction: navigationAction))
    
    private lazy var categoryImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "rootPictureMountain")
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var categoryNavigationButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "rootChevronRight"), for: .normal)
        $0.tintColor = .black
        return $0
    }(UIButton())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupShadows()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(profileImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(usernameLabel)
        view.addSubview(bellImageView)
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        searchButton.addSubview(searchIconImageView)
        view.addSubview(popularTripLabel)
        view.addSubview(seeAllLabel)
        
        view.addSubview(popularTripContainerView)
        popularTripContainerView.addSubview(popularTripImageView)
        popularTripImageView.addSubview(heartImageView)
        popularTripContainerView.addSubview(greenlandTitleLabel)
        popularTripContainerView.addSubview(greenlandNorthLabel)
        popularTripContainerView.addSubview(detailNavigationButton)
        
        view.addSubview(popularCategoryLabel)
        view.addSubview(seeAllLabelTwo)
        view.addSubview(popularCategoryContainerView)
        popularCategoryContainerView.addSubview(categoryImageView)
        popularCategoryContainerView.addSubview(mountainsTitleLabel)
        popularCategoryContainerView.addSubview(greenlandTitleLabelTwo)
        popularCategoryContainerView.addSubview(categoryNavigationButton)
    }
    
    private func setupShadows() {
        applyShadow(to: searchTextField)
        applyShadow(to: popularTripContainerView)
        applyShadow(to: popularCategoryContainerView)
    }
    
    private func applyShadow(to view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
    }
    
    // MARK: - Factory Methods
    private func createLabel(text: String, fontSize: Int, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = .systemFont(ofSize: CGFloat(fontSize), weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createTextField(placeholder: String, fontSize: Int, height: CGFloat = 48, backgroundColor: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = UIColor(named: "rootSearchInputColorText")
        textField.backgroundColor = UIColor(named: backgroundColor)
        textField.layer.cornerRadius = 18
        textField.font = .systemFont(ofSize: CGFloat(fontSize))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: height).isActive = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        textField.rightViewMode = .always
        
        // add shadow in textField
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = .zero
        textField.layer.shadowRadius = 10
        
        return textField
    }
    
    private func createLabel(text: String, fontSize: Int, weight: UIFont.Weight = .regular, textColor: UIColor = .black) -> UILabel {
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
            
            // constraint profileImageView
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 59),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileImageView.widthAnchor.constraint(equalToConstant: 45),
            profileImageView.heightAnchor.constraint(equalToConstant: 45),
            
            // constraint welcomeLabel
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 14),
            welcomeLabel.trailingAnchor.constraint(equalTo: bellImageView.leadingAnchor, constant: -10),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 15),
            
            // constraint usernameLabel
            usernameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 14),
            usernameLabel.trailingAnchor.constraint(equalTo: bellImageView.leadingAnchor, constant: -10),
            usernameLabel.heightAnchor.constraint(equalToConstant: 19),
            
            // constraint bellImageView
            bellImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            bellImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bellImageView.heightAnchor.constraint(equalToConstant: 20),
            bellImageView.widthAnchor.constraint(equalToConstant: 20),
            
            // constraint searchTextField
            searchTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 47),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // constraint searchButton
            searchButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 47),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            
            // constraint searchIconImageView
            searchIconImageView.centerXAnchor.constraint(equalTo: searchButton.centerXAnchor),
            searchIconImageView.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            searchIconImageView.widthAnchor.constraint(equalToConstant: 16),
            searchIconImageView.heightAnchor.constraint(equalToConstant: 16),
            
            // constraint popularTripLabel
            popularTripLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 50),
            popularTripLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            popularTripLabel.trailingAnchor.constraint(lessThanOrEqualTo: seeAllLabel.leadingAnchor, constant: -8),
            popularTripLabel.heightAnchor.constraint(equalToConstant: 22),
            
            // constraint seeAllLabel
            seeAllLabel.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 53),
            seeAllLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            seeAllLabel.heightAnchor.constraint(equalToConstant: 15),
            
            // constraint popularTripContainerView
            popularTripContainerView.topAnchor.constraint(equalTo: popularTripLabel.bottomAnchor, constant: 16),
            popularTripContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            popularTripContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            popularTripContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            popularTripContainerView.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            // constraint popularCategoryLabel
            popularCategoryLabel.topAnchor.constraint(equalTo: popularTripContainerView.bottomAnchor, constant: 59),
            popularCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            popularCategoryLabel.trailingAnchor.constraint(lessThanOrEqualTo: seeAllLabelTwo.leadingAnchor, constant: -8),
            popularCategoryLabel.heightAnchor.constraint(equalToConstant: 22),
             
            // constraint seeAllLabelTwo
            seeAllLabelTwo.topAnchor.constraint(equalTo: popularTripContainerView.bottomAnchor, constant: 64),
            seeAllLabelTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            seeAllLabelTwo.heightAnchor.constraint(equalToConstant: 15),
            
            // constraint popularCategoryContainerView
            popularCategoryContainerView.topAnchor.constraint(equalTo: popularCategoryLabel.bottomAnchor, constant: 16),
            popularCategoryContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            popularCategoryContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            popularCategoryContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),
            popularCategoryContainerView.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            
            // constraint popularTripImageView
            popularTripImageView.topAnchor.constraint(equalTo: popularTripContainerView.topAnchor, constant: 11),
            popularTripImageView.leadingAnchor.constraint(equalTo: popularTripContainerView.leadingAnchor, constant: 11),
            popularTripImageView.trailingAnchor.constraint(equalTo: popularTripContainerView.trailingAnchor, constant: -11),
            popularTripImageView.heightAnchor.constraint(equalTo: popularTripContainerView.heightAnchor, multiplier: 0.6),
            popularTripImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 90),
            popularTripImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 110),
            
            // constraint heartImageView
            heartImageView.topAnchor.constraint(equalTo: popularTripImageView.topAnchor, constant: 14),
            heartImageView.trailingAnchor.constraint(equalTo: popularTripImageView.trailingAnchor, constant: -15),
            heartImageView.widthAnchor.constraint(equalToConstant: 24),
            heartImageView.heightAnchor.constraint(equalToConstant: 24),
            
            // constraint greenlandTitleLabel
            greenlandTitleLabel.topAnchor.constraint(equalTo: popularTripImageView.bottomAnchor, constant: 13),
            greenlandTitleLabel.leadingAnchor.constraint(equalTo: popularTripContainerView.leadingAnchor, constant: 24),
            greenlandTitleLabel.trailingAnchor.constraint(equalTo: popularTripContainerView.trailingAnchor, constant: -217),
            greenlandTitleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            // constraint greenlandNorthLabel
            greenlandNorthLabel.topAnchor.constraint(equalTo: greenlandTitleLabel.bottomAnchor, constant: 4),
            greenlandNorthLabel.leadingAnchor.constraint(equalTo: popularTripContainerView.leadingAnchor, constant: 24),
            greenlandNorthLabel.trailingAnchor.constraint(equalTo: popularTripContainerView.trailingAnchor, constant: -100),
            greenlandNorthLabel.heightAnchor.constraint(equalToConstant: 15),
            
            // constraint detailNavigationButton
            detailNavigationButton.topAnchor.constraint(equalTo: popularTripImageView.bottomAnchor, constant: 14),
            detailNavigationButton.trailingAnchor.constraint(equalTo: popularTripContainerView.trailingAnchor, constant: -13),
            detailNavigationButton.widthAnchor.constraint(equalToConstant: 20),
            detailNavigationButton.heightAnchor.constraint(equalToConstant: 20),
            
            // constraint categoryImageView
            categoryImageView.topAnchor.constraint(equalTo: popularCategoryContainerView.topAnchor, constant: 8),
            categoryImageView.leadingAnchor.constraint(equalTo: popularCategoryContainerView.leadingAnchor, constant: 8),
            categoryImageView.widthAnchor.constraint(equalToConstant: 84),
            categoryImageView.heightAnchor.constraint(equalToConstant: 69),
            
            // constraint mountainsTitleLabel
            mountainsTitleLabel.topAnchor.constraint(equalTo: popularCategoryContainerView.topAnchor, constant: 19),
            mountainsTitleLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 12),
            mountainsTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -135),
            mountainsTitleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            // constraint greenlandTitleLabelTwo
            greenlandTitleLabelTwo.topAnchor.constraint(equalTo: mountainsTitleLabel.bottomAnchor, constant: 4),
            greenlandTitleLabelTwo.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 12),
            greenlandTitleLabelTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -170),
            greenlandTitleLabelTwo.heightAnchor.constraint(equalToConstant: 15),
            
            // constraint categoryNavigationButton
            categoryNavigationButton.topAnchor.constraint(equalTo: popularCategoryContainerView.topAnchor, constant: 20),
            categoryNavigationButton.trailingAnchor.constraint(equalTo: popularTripContainerView.trailingAnchor, constant: -13),
            categoryNavigationButton.widthAnchor.constraint(equalToConstant: 20),
            categoryNavigationButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    deinit {
        print("ViewController deinit")
    }
}

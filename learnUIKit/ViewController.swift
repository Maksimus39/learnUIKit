import UIKit

class ViewController: UIViewController {
    
    lazy var nameSurnameUser = createLabel(textLabel: "User Name", textSize: 20, weight: UIFont.Weight(rawValue: 900))
    lazy var yearsUser = createLabel(textLabel: "20 years", textSize: 14, weight: UIFont.Weight(500))
    lazy var aboutUser = createLabel(textLabel: "About", textSize: 14, weight: UIFont.Weight(900))
    
    
    lazy var action: UIAction = UIAction { [weak self] _ in
        let settingView = SettingsViewController()
        self?.navigationController?.pushViewController(settingView, animated: true)
    }
    
    lazy var mainButton: UIButton = {
        $0.setImage(UIImage(systemName: "gear"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: action))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("homeWork - 3")
        view.backgroundColor = .white
        title = "Главная"
        
        view.addSubview(mainButton)
        view.addSubview(imageView)
        view.addSubview(nameSurnameUser)
        view.addSubview(yearsUser)
        view.addSubview(aboutUser)
        view.addSubview(createTextView)
        view.addSubview(createButton)
        
        createRootConstraint()
        
        let buttonItem = UIBarButtonItem(customView: mainButton)
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    var imageView: UIImageView = {
        $0.image = UIImage(named: "img")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIImageView())
    
    var createTextView: UITextView = {
        $0.text = """
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
            """
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        return $0
    }(UITextView())
    
    var createButton:UIButton = {
        $0.setTitle("сохранить", for: .normal)
        $0.backgroundColor = UIColor(named: "figmaGreen")
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 16
        $0.contentHorizontalAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    private func createLabel(textLabel: String, textSize: Int, weight: UIFont.Weight) -> UILabel {
        let uiLabel = UILabel()
        uiLabel.text = textLabel
        uiLabel.textColor = .black
        uiLabel.font = .systemFont(ofSize: CGFloat(textSize), weight: weight)
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }
    
    private func createRootConstraint() {
        NSLayoutConstraint.activate([
            // constraint imageView
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -268),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            // constraint uilabel nameSurnameUser
            nameSurnameUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 139),
            nameSurnameUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nameSurnameUser.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameSurnameUser.heightAnchor.constraint(equalToConstant: 24),
            
            // constraint uilabel yearsUser
            yearsUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 139),
            yearsUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            yearsUser.topAnchor.constraint(equalTo: nameSurnameUser.bottomAnchor, constant: 3),
            yearsUser.heightAnchor.constraint(equalToConstant: 17),
            
            // constraint uilabel aboutUser
            aboutUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            aboutUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            aboutUser.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 35),
            aboutUser.heightAnchor.constraint(equalToConstant: 17),
            
            // constraint uilabel createTextView
            createTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            createTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            createTextView.topAnchor.constraint(equalTo: aboutUser.bottomAnchor, constant: 11),
            createTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            // constraint uilabel button
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            createButton.topAnchor.constraint(equalTo: yearsUser.bottomAnchor, constant: 227),
            createButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    
    
    deinit {
        print("ViewController deinit")
    }
}

import UIKit


class SettingsViewController: UIViewController {
    
    lazy var firstNameUser = createLabel(textLabel: "first name", textSize: 14)
    lazy var textFieldFirstName = createTextField(placeholder: "Enter your first name", textSize: 16)
    lazy var lastNameUser = createLabel(textLabel: "last name", textSize: 14)
    lazy var textFieldLastName = createTextField(placeholder: "Enter your last name", textSize: 16)
    lazy var nationaldUser = createLabel(textLabel: "National ID number", textSize: 14)
    lazy var textFieldIDNumber = createTextField(placeholder: "Enter your National ID number", textSize: 16)
    
    lazy var settingsAction: UIAction = UIAction { [weak self] _ in
        self?.navigationController?.popViewController(animated: true)
    }
    
    lazy var mainSettingsButton: UIButton = {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.setTitle("Главная", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: settingsAction))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        
        view.addSubview(mainSettingsButton)
        view.addSubview(firstNameUser)
        view.addSubview(textFieldFirstName)
        view.addSubview(lastNameUser)
        view.addSubview(textFieldLastName)
        view.addSubview(nationaldUser)
        view.addSubview(textFieldIDNumber)
        view.addSubview(createButton)
        
        
        
        createSettingsConstraint()
        
        
        
        let buttonItem = UIBarButtonItem(customView: mainSettingsButton)
        navigationItem.leftBarButtonItem = buttonItem
    }
    
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
    
    private func createLabel(textLabel: String, textSize: Int) -> UILabel {
        let uiLabel = UILabel()
        uiLabel.text = textLabel
        uiLabel.textColor = .black
        uiLabel.font = .systemFont(ofSize: CGFloat(textSize))
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }
    
    private func createTextField(placeholder: String, textSize: Int, height: CGFloat = 48) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = .black
        textField.backgroundColor = UIColor(named: "LightGrayBackground")
        textField.layer.cornerRadius = 10
        textField.font = .systemFont(ofSize: CGFloat(textSize))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: height).isActive = true
        textField.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame:  CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.rightViewMode = .always
        return textField
    }
    
    private func createSettingsConstraint(){
        NSLayoutConstraint.activate([
            // constraint firstNameUser
            firstNameUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            firstNameUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            firstNameUser.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            firstNameUser.heightAnchor.constraint(equalToConstant: 20),
            
            // constraint textFieldFirstName
            textFieldFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textFieldFirstName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textFieldFirstName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textFieldFirstName.heightAnchor.constraint(equalToConstant: 48),
            
            // constraint lastNameUser
            lastNameUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lastNameUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            lastNameUser.topAnchor.constraint(equalTo: textFieldFirstName.bottomAnchor, constant: 16),
            lastNameUser.heightAnchor.constraint(equalToConstant: 20),
            
            // constraint textFieldLastName
            textFieldLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textFieldLastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textFieldLastName.topAnchor.constraint(equalTo: lastNameUser.bottomAnchor, constant: 4),
            textFieldLastName.heightAnchor.constraint(equalToConstant: 48),
            
            // constraint nationaldUser
            nationaldUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nationaldUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nationaldUser.topAnchor.constraint(equalTo: textFieldLastName.bottomAnchor, constant: 16),
            nationaldUser.heightAnchor.constraint(equalToConstant: 20),
            
            // constraint textFieldIDNumber
            textFieldIDNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textFieldIDNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textFieldIDNumber.topAnchor.constraint(equalTo: nationaldUser.bottomAnchor, constant: 4),
            textFieldIDNumber.heightAnchor.constraint(equalToConstant: 48),
            
            // constraint createButton
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            createButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
    deinit {
        print("SettingsViewController deinit")
    }
}

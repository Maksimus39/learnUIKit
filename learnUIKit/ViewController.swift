import UIKit

class ViewController: UIViewController {
    
    lazy var uiLabelMessage = createLabel(textLabel: "Сообщение", textSize: 20)
    lazy var textFieldEmail = createTextField(placeholder: "Email", textSize: 16)
    lazy var textFieldTopic = createTextField(placeholder: "Тема", textSize: 16)
    lazy var textFieldContent = createLabel(textLabel: "Содержимое", textSize: 16)
    
    var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var createTextView:UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.textColor = .black
        textView.backgroundColor = UIColor(named: "LightGrayBackground")
        textView.font = .systemFont(ofSize: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 25
        return textView
    }()
    
    var createButton:UIButton = {
        let buttonView = UIButton()
        buttonView.setTitle("Отправить", for: .normal)
        buttonView.backgroundColor = .black
        buttonView.setTitleColor(.white, for: .normal)
        buttonView.titleLabel?.font = .systemFont(ofSize: 16)
        buttonView.layer.cornerRadius = 25
        buttonView.contentHorizontalAlignment = .center
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(uiLabelMessage)
        view.addSubview(textFieldEmail)
        view.addSubview(textFieldTopic)
        view.addSubview(textFieldContent)
        view.addSubview(createTextView)
        view.addSubview(createButton)
        createConstraint()
    }
    
    private func createConstraint(){
        NSLayoutConstraint.activate([
            // constraint imageView
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26),
            imageView.heightAnchor.constraint(equalToConstant: 239),
            
            // constraint uiLabelMessage
            uiLabelMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            // этот элемент я сделал больше чем на макете чтобы влезло слово целиком
            uiLabelMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            uiLabelMessage.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 23),
            uiLabelMessage.heightAnchor.constraint(equalToConstant: 24),
            
            // constraint textFieldEmail
            textFieldEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldEmail.topAnchor.constraint(equalTo: uiLabelMessage.bottomAnchor, constant: 10),
            
            // constraint textFieldTopic
            textFieldTopic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldTopic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldTopic.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 19),
            
            // constraint textFieldContent
            textFieldContent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            textFieldContent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -39),            textFieldContent.topAnchor.constraint(equalTo: textFieldTopic.bottomAnchor, constant: 23),
            textFieldContent.heightAnchor.constraint(equalToConstant: 19),
            
            // constraint createTextView
            createTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createTextView.topAnchor.constraint(equalTo: textFieldContent.bottomAnchor, constant: 8),
            createTextView.bottomAnchor.constraint(lessThanOrEqualTo: createButton.topAnchor, constant: -16),
            createTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
            createTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            
            // constraint createButton
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            createButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func createLabel(textLabel: String, textSize: Int) -> UILabel {
        let uiLabel = UILabel()
        uiLabel.text = textLabel
        uiLabel.textColor = .black
        uiLabel.font = .systemFont(ofSize: CGFloat(textSize))
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }
    
    private func createTextField(placeholder: String, textSize: Int, height: CGFloat = 50) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = .black
        textField.backgroundColor = UIColor(named: "LightGrayBackground")
        textField.layer.cornerRadius = 25
        textField.font = .systemFont(ofSize: CGFloat(textSize))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: height).isActive = true
        textField.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 19, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame:  CGRect(x: 0, y: 0, width: 19, height: 0))
        textField.rightViewMode = .always
        return textField
    }
}


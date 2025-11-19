import UIKit

class ViewController: UIViewController {
    
    lazy var emailField = createTextField(placeholder: "Email")
    lazy var passwordField = createTextField(placeholder: "Password", isPassword: true)
    
    var textEdit: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .magenta
        textView.layer.cornerRadius = 15
        textView.font = .systemFont(ofSize: 16)
        return textView
    }()
    
    var sendBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("send", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 25
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(textEdit)
        view.addSubview(sendBtn)
        createConstraint()
    }
    
    private func createConstraint(){
        NSLayoutConstraint.activate([
            // constraint emailField
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailField.heightAnchor.constraint(equalToConstant: 30),
            
            // constraint password
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            
            // constraint textEdit
            textEdit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textEdit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textEdit.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            textEdit.heightAnchor.constraint(equalToConstant: 60),
            
            // constraint button
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            sendBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            sendBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func createTextField(placeholder: String, isPassword: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isPassword
        textField.backgroundColor = .green
        textField.layer.cornerRadius = 20
        
        // TAMIC
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.rightViewMode = .always
        
        return textField
    }
}

// 1 - Инициализация класса, инициализируются все переменные, обращаемся из функции то любая переменная 100% готова
// lazy var - ждёт вызова и благодаря lazy мы можем вынести констрейнт в другую функцию а функцию объявить в класссе и она сработает

// Если есть одинаковые элементы то выносить в функцию

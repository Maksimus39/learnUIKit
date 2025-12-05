import UIKit

class SecondViewController: UIViewController {
    
    // 4 ждём ссылку на протокол - делегат
    weak var delegate: ViewControllerDelegate?
    
    private lazy var addBtn: UIButton = {
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .blue
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
        $0.frame.origin = CGPoint(x: view.frame.width - 100, y: view.frame.height - 100)
        return $0
    }(UIButton(primaryAction: UIAction(handler: { [weak self] _ in
        let secondVC = SecondViewController()
        self?.navigationController?.pushViewController(secondVC, animated: true)
    })))
    
    lazy var textField: UITextField = {
        $0.frame = CGRect(x: 30, y: 120, width: view.frame.width - 50, height: 40)
        $0.backgroundColor = .gray
        $0.tag = 1
        $0.delegate = self
        return $0
    }(UITextField())
    
    lazy var textField2: UITextField = {
        $0.frame = CGRect(x: 30, y: 200, width: view.frame.width - 50, height: 40)
        $0.backgroundColor = .red
        $0.tag = 2
        $0.delegate = self
        return $0
    }(UITextField())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .opaqueSeparator
        
        view.addSubview(addBtn)
        view.addSubview(textField)
        view.addSubview(textField2)
    }
    
    private func printContent(_ text: String?) {
        print("Content: \(text ?? "No text")")
    }
    
    deinit {
        print("SecondViewController deinit")
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            print(textField.text ?? "No text")
        } else if textField.tag == 2 {
            print(textField2.text ?? "No text")
        }
        printContent(textField.text)
        // 5 Обращаемся к функции протокола реализовываем делегате
        self.delegate?.setLabelText(text: textField.text)
        
        return true
    }
}

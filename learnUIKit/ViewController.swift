import UIKit

// 1 Создать протокол с функцией которую будем делегировать
protocol ViewControllerDelegate: AnyObject{
    func setLabelText(text: String?)
}


// 2 Класс который будет ДЕЛЕГИРОВАТЬ подписываем под протокол
class ViewController: UIViewController, ViewControllerDelegate {
    
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
        // 6 Передать ссылку
        secondVC.delegate = self
        self?.navigationController?.pushViewController(secondVC, animated: true)
    })))
    
    lazy var label: UILabel = {
        $0.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 200)
        $0.text = "Lorem"
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .opaqueSeparator
        view.addSubview(label)
        view.addSubview(addBtn)
    }
    
    // 3 Реализовали протокол
    func setLabelText(text: String?){
        self.label.text = text
    }
}

// паттерны GoF

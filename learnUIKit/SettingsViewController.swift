import UIKit


class SettingsViewController: UIViewController {
    
    lazy  var action: UIAction = UIAction { _ in
        //1
        //let viewController = ViewController()
        
        //2
        self.navigationController?.popViewController(animated: true)
    }
    
    lazy  var btn: UIButton = {
        $0.setTitle("back to home", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton(primaryAction: action))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        title = "back to home"
        
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    deinit {
        print("close settings")
    }
}

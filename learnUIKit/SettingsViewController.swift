import UIKit


class SettingsViewController: UIViewController {
    
    lazy  var action: UIAction = UIAction { [weak self] _ in
        //1
        //let viewController = ViewController()
        
        //2
        self?.navigationController?.popViewController(animated: true)
    }
    
    lazy  var btn: UIButton = {
        $0.setTitle("back to home", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton(primaryAction: action))
    
    override func viewWillAppear(_ animated: Bool) {
        print("2 - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("2 - viewDidAppear")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2 - viewDidLoad")
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
    
    override func viewWillDisappear(_ animated: Bool) {
        print("2 - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("2 - viewDidDisappear")
    }
}

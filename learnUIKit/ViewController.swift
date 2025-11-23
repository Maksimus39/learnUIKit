import UIKit

class ViewController: UIViewController {
    
    lazy  var action: UIAction = UIAction { [weak self] _ in
        //1
        let settingView = SettingsViewController()
        
        //2
        self?.navigationController?.pushViewController(settingView, animated: true)
    }
    
    lazy  var btn: UIButton = {
        $0.setTitle("Settings", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton(primaryAction: action))
    
    override func viewWillAppear(_ animated: Bool) {
        print("1 - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("1 - viewDidAppear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 - viewDidLoad")
        view.backgroundColor = .orange
        title = "Hello world"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // leftBarButtonItem - если слева отобразить а можно и массив кнопок
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(setCameraBtn))
    }
    
    @objc func setCameraBtn(){
        let settingView = SettingsViewController()
        
        self.present(settingView, animated: true)
        print("select camera")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("1 - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("1 - viewDidDisappear")
    }
}

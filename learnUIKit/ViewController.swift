import UIKit

class ViewController: UIViewController {
    
    private lazy var bunnerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        return $0
    }(UIView())
    
    
    private lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "imgOleg")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    
    private lazy var leftButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        //$0.backgroundColor = .red
        $0.setImage(.imgR, for: .normal)
        $0.tintColor = .white
        return $0
    }(UIButton())
    
    private lazy var nameLabel: UILabel = {
        $0.text = """
            qwertyuiopasdfghjkl.,mnbvcxzvhjkdgchjvjfhvjkfhjvkbfnsjkvbnfjskbbvjkvjkbsdfnjkvbfgjb jfgs
            qwertyuiopasdfghjkl.,mnbvcxzvhjkdgchjvjfhvjkfhjvkbfnsjkvbnfjskbbvjkvjkbsdfnjkvbfgjb jfgs
            """
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .blue
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(bunnerView)
        bunnerView.addSubview(imageView)
        bunnerView.addSubview(leftButton)
        bunnerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            // constraint bunnerView
            bunnerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            bunnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bunnerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            //bunnerView.heightAnchor.constraint(equalToConstant: 100), // ❌ Этого нет
            
            // constraint imageView
            imageView.topAnchor.constraint(equalTo: bunnerView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: bunnerView.leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            
            // constraint leftButton
            leftButton.topAnchor.constraint(equalTo: bunnerView.topAnchor, constant: 10),
            leftButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            leftButton.widthAnchor.constraint(equalToConstant: 20),
            leftButton.heightAnchor.constraint(equalToConstant: 20),
            
            // constraint imageView
            //imageView.bottomAnchor.constraint(equalTo: bunnerView.bottomAnchor, constant: -10),
            
            // constraint nameLabel
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: bunnerView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: bunnerView.trailingAnchor, constant: -20),
            nameLabel.bottomAnchor.constraint(equalTo: bunnerView.bottomAnchor, constant: -10)
        ])
    }
    
}

//
//  ViewController.swift
//  learnUIKit
//
//  Created by Максим Минаков on 14.11.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello")
        
        view.backgroundColor = .orange
        // label
        let label = UILabel()
        label.text = "Hello world"
        label.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        label.textColor = .blue
        label.font = .systemFont(ofSize: 50)
        view.addSubview(label)
        print(view.frame)
        
        // image
        let someImageView = UIImageView()
        someImageView.frame = CGRect(x: 100, y: 200, width: 300, height: 300)
        someImageView.backgroundColor = .green
        someImageView.image = UIImage(named: "img1")
        someImageView.contentMode = .scaleAspectFill
        view.addSubview(someImageView)
        
        // button
        let action = UIAction { _ in
            someImageView.frame = self.view.frame
        }
        
        let button = UIButton(frame: CGRect(x: 50,
                                            y: 600,
                                            width: 200,
                                            height: 80), primaryAction: action)
        
        button.setTitle("btn", for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
    }
}


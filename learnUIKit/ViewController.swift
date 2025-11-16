import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIImageView
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "img1")
        avatarImageView.frame = CGRect(x: 36, y: 60, width: 114, height: 114)
        view.addSubview(avatarImageView)
        
        // UILabel name surname
        let nameSurnameLabel = UILabel()
        nameSurnameLabel.text = "Имя Фамилия"
        nameSurnameLabel.frame = CGRect(x: 164, y: 82, width: 109, height: 19)
        nameSurnameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nameSurnameLabel.textColor = .label
        view.addSubview(nameSurnameLabel)
        
        // UILabel age
        let ageLabel = UILabel()
        ageLabel.text = "30 лет"
        ageLabel.frame = CGRect(x: 164, y: 113, width: 52, height: 19)
        ageLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        ageLabel.textColor = .label
        view.addSubview(ageLabel)
        
        // UIButton
        let button = UIButton()
        button.frame = CGRect(x: 36, y: 225, width: 321, height: 53)
        button.backgroundColor = .black
        
        // Установка текста кнопки
        button.setTitle("Редактировать профиль", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.addSubview(button)
        
        // UILabel
        let aboutMe = UILabel()
        aboutMe.text = "О себе"
        aboutMe.frame = CGRect(x: 36, y: 316, width: 54, height: 19)
        aboutMe.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        aboutMe.textColor = .black
        view.addSubview(aboutMe)
        
        // UILabel
        let aboutMeText = UILabel()
        aboutMeText.text = """
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
            """
        aboutMeText.frame = CGRect(x: 36, y: 346, width: 321, height: 114)
        aboutMeText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        aboutMeText.textColor = .black
        aboutMeText.numberOfLines = 0
        aboutMeText.lineBreakMode = .byWordWrapping
        view.addSubview(aboutMeText)
        
        // UIButton
        let buttonDeleteData = UIButton()
        buttonDeleteData.frame = CGRect(x: 36, y: 498, width: 321, height: 53)
        buttonDeleteData.backgroundColor = .red
        
        // Установка текста кнопки
        buttonDeleteData.setTitle("Удалить данные", for: .normal)
        buttonDeleteData.setTitleColor(.white, for: .normal)
        buttonDeleteData.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.addSubview(buttonDeleteData)
        
        // UIImageView
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img2")
        imageView.frame = CGRect(x: 36, y: 589, width: 321, height: 185)
        view.addSubview(imageView)
    }
}


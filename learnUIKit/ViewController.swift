import UIKit

class ViewController: UIViewController {
    lazy var textCreateText: String = """
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    """
    
    lazy var textDescription: String = """
           Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
           """
    
    enum Fonts {
        static let regular = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let medium = UIFont.systemFont(ofSize: 16, weight: .medium)
        static let bold = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let headerView = HeaderView(name: "Анна", image: UIImage(named: "anna"))
    private let secondPhotoStackView = SecondPhotoStackView()
    private let threePhotoView = ThreePhotoStackView(images: [.photo5, .photo6])
    private let descriptionLabelStack = DescriptionView(description: "Description", titleButton: "See All")
    
    private lazy var textSection = createText(text: textCreateText, font: Fonts.regular)
    private lazy var textSectionDeccription = createText(text: textDescription, font: Fonts.regular)
    private lazy var photosSection = createText(text: "Photos", font: Fonts.bold)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupScrollView()
        setupLayout()
    }
    
    func createText(text: String, font: UIFont) -> UILabel {
        let txt = UILabel()
        txt.text = text
        txt.textColor = .black
        txt.numberOfLines = 0
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = font
        return txt
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupLayout() {
        contentView.addSubview(headerView)
        contentView.addSubview(secondPhotoStackView)
        contentView.addSubview(textSection)
        contentView.addSubview(photosSection)
        contentView.addSubview(threePhotoView)
        contentView.addSubview(descriptionLabelStack)
        contentView.addSubview(textSectionDeccription)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        secondPhotoStackView.translatesAutoresizingMaskIntoConstraints = false
        threePhotoView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabelStack.translatesAutoresizingMaskIntoConstraints = false
        textSectionDeccription.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // constraint headerView
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            headerView.heightAnchor.constraint(equalToConstant: 64),
            
            // constraint secondPhotoStackView
            secondPhotoStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 26),
            secondPhotoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            secondPhotoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            secondPhotoStackView.heightAnchor.constraint(equalToConstant: 80),
            
            // constraint textSection
            textSection.topAnchor.constraint(equalTo: secondPhotoStackView.bottomAnchor, constant: 26),
            textSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // constraint photosSection
            photosSection.topAnchor.constraint(equalTo: textSection.bottomAnchor, constant: 42),
            photosSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photosSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            photosSection.heightAnchor.constraint(equalToConstant: 19),
            
            // constraint threePhotoView
            threePhotoView.topAnchor.constraint(equalTo: photosSection.bottomAnchor, constant: 18),
            threePhotoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            threePhotoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            threePhotoView.heightAnchor.constraint(equalToConstant: 110),
            
            // constraint descriptionLabelStack
            descriptionLabelStack.topAnchor.constraint(equalTo: threePhotoView.bottomAnchor, constant: 42),
            descriptionLabelStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabelStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabelStack.heightAnchor.constraint(equalToConstant: 19),
            
            // constraint textSectionDeccription
            textSectionDeccription.topAnchor.constraint(equalTo: descriptionLabelStack.bottomAnchor, constant: 18),
            textSectionDeccription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textSectionDeccription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textSectionDeccription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

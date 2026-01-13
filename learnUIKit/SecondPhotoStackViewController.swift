import UIKit

class SecondPhotoStackView: UIView {
    
    private let photoImages: [UIImage] = [.photo1, .photo2, .photo3, .photo4]
    
    lazy var secondPhotoStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 18
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupPhotos()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupPhotos()
        setupLayout()
    }
    
    private func setupView() {
        addSubview(secondPhotoStack)
    }
    
     func setupPhotos() {
        photoImages.forEach { image in
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: 80)
            ])
            
            secondPhotoStack.addArrangedSubview(imageView)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            secondPhotoStack.topAnchor.constraint(equalTo: topAnchor),
            secondPhotoStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondPhotoStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondPhotoStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

import UIKit

class ThreePhotoStackView: UIView {

    private var photoImages: [UIImage] = [.photo5, .photo6]
    
    lazy var threePhotoStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 13
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    init(images: [UIImage] = [.photo5, .photo6]) {
            self.photoImages = images
            super.init(frame: .zero)
            setupView()
            setupPhotos()
            setupLayout()
        }
    
    required init?(coder: NSCoder) {
           self.photoImages = [.photo5, .photo6]
           super.init(coder: coder)
           setupView()
           setupPhotos()
           setupLayout()
       }
    
    private func setupView() {
        addSubview(threePhotoStack)
    }
    
    func setupPhotos(){
        photoImages.forEach { photo in
            let photoView = UIImageView(image: photo)
            photoView.contentMode = .scaleAspectFill
            photoView.clipsToBounds = true
            photoView.layer.cornerRadius = 10
            photoView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                photoView.heightAnchor.constraint(equalToConstant: 110)
            ])
            
            threePhotoStack.addArrangedSubview(photoView)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            threePhotoStack.topAnchor.constraint(equalTo: topAnchor),
            threePhotoStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            threePhotoStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            threePhotoStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

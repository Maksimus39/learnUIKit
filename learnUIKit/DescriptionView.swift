import UIKit

class DescriptionView: UIView {
     
    lazy var descriptionLabel = createText(weight: .bold)
    
    private let seeAllButton: UIButton = {
        $0.setTitle(NSLocalizedString("See all", comment: ""), for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return $0
    }(UIButton())
    
    private lazy var descriptionStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    init(description: String, titleButton: String) {
        super.init(frame: .zero)
        descriptionLabel.text = description
        seeAllButton.setTitle(titleButton, for: .normal)
        
        
        setupDescriptionView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDescriptionView(){
        let descriptionStack = UIStackView(arrangedSubviews: [descriptionLabel, seeAllButton])
        descriptionStack.distribution = .equalSpacing
        descriptionStack.axis = .horizontal
        descriptionStack.alignment = .center
        
        descriptionStackView.addArrangedSubview(descriptionStack)
        addSubview(descriptionStackView)
    }
    
    func createText(weight: UIFont.Weight) -> UILabel {
        let txt = UILabel()
        txt.textColor = .black
        txt.numberOfLines = 0
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = .systemFont(ofSize: 16, weight: weight)
        return txt
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            descriptionStackView.topAnchor.constraint(equalTo: topAnchor),
            descriptionStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

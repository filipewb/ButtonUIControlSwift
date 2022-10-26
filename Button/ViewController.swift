import UIKit

class ViewController: UIViewController {
    
    private lazy var buttonView: UIControl = {
       let view = UIControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 0, green: 0.176, blue: 0.384, alpha: 1).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var stackViewButtonStore: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImage, nameLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "house")
        imageView.tintColor = UIColor(red: 0, green: 0.176, blue: 0.384, alpha: 1)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste"
        label.textColor = UIColor(red: 0, green: 0.176, blue: 0.384, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private lazy var textFieldComponent: TextFieldComponent = {
        let text = TextFieldComponent()
        text.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        text.layer.cornerRadius = 15
        text.placeholder = "O que você procura"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var searchIconComponent: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        return image
    }()
    
    private lazy var imageContainer: UIView = {
        let image = UIView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(red: 0.176, green: 0.655, blue: 0.478, alpha: 1)
        image.layer.cornerRadius = 15
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(buttonView)
        buttonView.addSubview(stackViewButtonStore)
        
        view.addSubview(imageLogo)
        
        imageContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchClick)))
        view.addSubview(textFieldComponent)
        textFieldComponent.addSubview(imageContainer)
        imageContainer.addSubview(searchIconComponent)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            buttonView.heightAnchor.constraint(equalToConstant: 40),
            buttonView.widthAnchor.constraint(equalToConstant: 92),
            
            stackViewButtonStore.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            stackViewButtonStore.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            
            imageLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            imageLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            imageLogo.widthAnchor.constraint(equalToConstant: 145),
            imageLogo.heightAnchor.constraint(equalToConstant: 40),
            
            textFieldComponent.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 30),
            textFieldComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textFieldComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            textFieldComponent.heightAnchor.constraint(equalToConstant: 35),
            
            imageContainer.trailingAnchor.constraint(equalTo: textFieldComponent.trailingAnchor),
            imageContainer.topAnchor.constraint(equalTo: textFieldComponent.topAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: textFieldComponent.bottomAnchor),
            imageContainer.widthAnchor.constraint(equalToConstant: 35),
            
            searchIconComponent.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            searchIconComponent.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
        ])
    }
    
    @objc func didTapButton() {
        print("tocou no botao")
    }
    
    @objc func searchClick() {
        print("tocou no botao pesquisar")
    }


}


//
//  IconLabelView.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit


class IconLabelView: BaseView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .appSecondary
        return imageView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .appSecondary
        
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func configure(icon: UIImage?, text: String) {
        imageView.image = icon
        valueLabel.text = text
    }
    
    init(icon: UIImage?, text: String) {
        super.init(frame: .zero)
        
        configure(icon: icon, text: text)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateValue(_ text: String) {
        valueLabel.text = text
    }
}


extension IconLabelView{
    override func setupViews() {
        super.setupViews()
        
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(valueLabel)
        
        addSubview(stack)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureApearence() {
        super.configureApearence()
    }
}


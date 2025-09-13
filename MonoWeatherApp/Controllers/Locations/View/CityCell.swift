//
//  CityCell.swift
//  MonoWeatherApp
//
//  Created by mac on 13.09.2025.
//

import UIKit

class CityCell: UITableViewCell {
    
    static let reuseId = "CityCell"
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.primary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 16)
        label.textColor = R.Colors.secondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 16)
        label.textColor = R.Colors.secondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private let iconView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = R.Colors.primary
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        constraintViews()
        configureApearence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(city: String, temp: String, desc: String, icon: UIImage?) {
        cityLabel.text = city
        tempLabel.text = temp
        descriptionLabel.text = desc
        iconView.image = icon
    }
}

private extension CityCell {
    
    func setupViews(){
        stack.addArrangedSubview(cityLabel)
        stack.addArrangedSubview(tempLabel)
        stack.addArrangedSubview(descriptionLabel)
        
        contentView.addSubview(stack)
        contentView.addSubview(iconView)
    }
    
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: iconView.leadingAnchor, constant: -12),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureApearence() {
        backgroundColor = .clear
    }
}



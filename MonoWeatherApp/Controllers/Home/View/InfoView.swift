//
//  InfoView.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit

class InfoView: BaseView {
    let syncLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Home.inSync
        label.font = R.Fonts.helveticaRegular(with: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.text = "Friday, 25 December 2025"
        label.font =  R.Fonts.helveticaRegular(with: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        
        let data = "22°C"
        let attributedString = NSMutableAttributedString(string: data)
        
        attributedString.addAttributes([
            .font: R.Fonts.helveticaRegular(with: 98)
        ], range: NSRange(location: 0, length: 2))
        
        if let unitRange = data.range(of: "°C") {
            let nsRange = NSRange(unitRange, in: data)
            attributedString.addAttributes([
                .font: R.Fonts.helveticaRegular(with: 40)
            ], range: nsRange)
        }
        
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempDown = IconLabelView(icon: R.Images.Home.arrowDown, text: "16°C")
    let tempUp = IconLabelView(icon: R.Images.Home.arrowUp, text: "25°C")
    
    let tempViewStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 20
        
        return stack
    }()
    
    let tempStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let weatherIcon: UIImageView = {
        let icon = UIImageView()
        let configuration = UIImage.SymbolConfiguration(pointSize: 128, weight: .regular, scale: .medium)
        icon.image = UIImage(systemName: "cloud.rain", withConfiguration: configuration)
        icon.tintColor = R.Colors.primary
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    let weatherTitle: UILabel = {
        let label = UILabel()
        label.text = "Light Drizzle"
        label.font = R.Fonts.helveticaRegular(with: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let weatherStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let sunrise = IconLabelView(icon: R.Images.Home.sunrise, text: "06:42")
    let sunset = IconLabelView(icon: R.Images.Home.sunset, text: "19:55")
    
    let sunStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 50
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
}

extension InfoView{
    override func setupViews() {
        super.setupViews()
        
        stack.addArrangedSubview(syncLabel)
        
        tempStack.addArrangedSubview(dataLabel)
        tempStack.addArrangedSubview(tempLabel)
        
        tempViewStack.addArrangedSubview(tempDown)
        tempViewStack.addArrangedSubview(tempUp)
        
        tempStack.addArrangedSubview(tempViewStack)
        
        stack.addArrangedSubview(tempStack)
        
        weatherStack.addArrangedSubview(weatherIcon)
        weatherStack.addArrangedSubview(weatherTitle)
    
        stack.addArrangedSubview(weatherStack)
        
        sunStack.addArrangedSubview(sunrise)
        sunStack.addArrangedSubview(sunset)
        stack.addArrangedSubview(sunStack)
        
        addSubview(stack)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    override func configureApearence() {
        super.configureApearence()
    }
}

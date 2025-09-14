//
//  SettingsCell.swift
//  MonoWeatherApp
//
//  Created by mac on 14.09.2025.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupViews()
        constraintViews()
        configureApearence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, subtitle: String, accessory: UITableViewCell.AccessoryType) {
        
        textLabel?.text = title
        textLabel?.font = R.Fonts.helveticaRegular(with: 17)
        textLabel?.textColor = R.Colors.primary
        
        detailTextLabel?.text = subtitle
        detailTextLabel?.font = R.Fonts.helveticaRegular(with: 13)
        detailTextLabel?.textColor = R.Colors.secondary
        
        accessoryType = accessory
    }
    
}

private extension SettingsCell {
    
    func setupViews(){
       
    }
    
    func constraintViews() {
        
    }
    
    func configureApearence() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}



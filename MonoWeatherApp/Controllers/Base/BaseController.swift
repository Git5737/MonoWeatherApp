//
//  BaseController.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    func setupViews() {
    }
    
    func constraintViews() {
        
    }
    
    func configureAppearance() {
        view.backgroundColor = .appBackground
    }
    
}
        
        
        

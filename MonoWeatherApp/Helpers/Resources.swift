//
//  Resources.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit

enum R {
    enum Colors {
        static let primary = UIColor.appMain
        static let secondary = UIColor.appSecondary
    }
    
    enum Strings {
        enum Home {
            static let currentLocation = "Current Location"
            static let inSync = "in sync"
        }
    }
    
    enum Images {
        enum Home {
            static let gearshape = UIImage(systemName: "gearshape")
            static let map = UIImage(systemName: "map")
            
            static let arrowDown = UIImage(systemName: "arrow.down")
            static let arrowUp = UIImage(systemName: "arrow.up")
            
            static let sunrise = UIImage(systemName: "sunrise.fill")
            static let sunset = UIImage(systemName: "sunset.fill")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "HelveticaNeue-CondensedRegular", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
}

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
        
        enum Locations {
            static let selectCity = "Select City"
            static let settings = "Settings"
        }
        
        enum Settings {
            
            static let themeHeader = "Theme"
            static let feedbackHeader = "Feedback"
            static let aboutHeader = "About"
            

            static let darkThemeTitle = "Dark Theme"
            static let darkThemeSubtitle = "Join the Dark Side!"
            
            static let lightThemeTitle = "Light Theme"
            static let lightThemeSubtitle = "Let There be Light!"
            
            static let reportIssueTitle = "Report an Issue"
            static let reportIssueSubtitle = "Facing an issue? Report and we’ll look into it."
            
            static let rateTitle = "Rate on App Store"
            static let rateSubtitle = "Enjoying the app? Leave a review on the App Store."
            
            static let aboutTitle = "About Weather"
            static let aboutSubtitle = "Read a bit more about the app."
            
            static let teamTitle = "The Team"
            static let teamSubtitle = "Get to know the team that made Weather a reality."
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
        
        enum Locations {
            static let add = UIImage(systemName: "plus")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "HelveticaNeue-CondensedRegular", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
}

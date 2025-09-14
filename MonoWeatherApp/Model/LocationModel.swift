//
//  LocationModel.swift
//  MonoWeatherApp
//
//  Created by mac on 14.09.2025.
//

import UIKit

struct LocationData {
    static var cities: [(name: String, temp: String, desc: String, icon: UIImage?)] = [
        ("Kyiv", "22°C", "Light Drizzle", UIImage(systemName: "sun.max")),
        ("Lviv", "18°C", "Sunny", UIImage(systemName: "cloud.rain")),
        ("Odesa", "25°C", "Sunny", UIImage(systemName: "cloud.sun"))
    ]
}

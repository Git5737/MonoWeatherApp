//
//  WeatherUtils.swift
//  MonoWeatherApp
//
//  Created by mac on 16.09.2025.
//

import Foundation

struct WeatherUtils {
    static let weatherIconMap: [String: String] = [
        "01d": "sun.max",         // Clear sky (day)
        "01n": "moon",            // Clear sky (night)
        "02d": "cloud.sun",       // Few clouds (day)
        "02n": "cloud.moon",      // Few clouds (night)
        "03d": "cloud",           // Scattered clouds
        "03n": "cloud",           // Scattered clouds (night)
        "04d": "smoke",           // Broken clouds
        "04n": "smoke",           // Broken clouds (night)
        "09d": "cloud.drizzle",   // Shower rain
        "09n": "cloud.drizzle",   // Shower rain (night)
        "10d": "cloud.rain",      // Rain (day)
        "10n": "cloud.rain",      // Rain (night)
        "11d": "cloud.bolt",      // Thunderstorm (day)
        "11n": "cloud.bolt",      // Thunderstorm (night)
        "13d": "snowflake",       // Snow (day)
        "13n": "snowflake",       // Snow (night)
        "50d": "cloud.fog",       // Mist (day)
        "50n": "cloud.fog"        // Mist (night)
    ]
}

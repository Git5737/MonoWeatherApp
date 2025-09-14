//
//  WeatherResponse.swift
//  MonoWeatherApp
//
//  Created by mac on 14.09.2025.
//

import Foundation


struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let sys: Sys
}

struct Weather: Codable {
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Float
    let temp_min: Float
    let temp_max: Float
}

struct Sys: Codable {
     let sunrise: Int
     let sunset: Int
}

//
//  WeatherServise.swift
//  MonoWeatherApp
//
//  Created by mac on 14.09.2025.
//


import Combine
import Foundation
import UIKit

class WeatherService {
    private let apiKey: String
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func fetchWeather(lat: Float, lon: Float) -> AnyPublisher<CityModel, Error> {
        let urlString = "\(baseURL)?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { response in
                let temp = String(format: "%.0f°C", response.main.temp)
                let tempMin = String(format: "%.0f°C", response.main.temp_min)
                let tempMax = String(format: "%.0f°C", response.main.temp_max)
                let iconCode = response.weather.first?.icon ?? "01d"
                let iconName = WeatherUtils.weatherIconMap[iconCode] ?? "sun.max"
                return CityModel(
                    name: response.name,
                    lat: response.coord.lat,
                    lon: response.coord.lon,
                    temp: temp,
                    tempMin: tempMin,
                    tempMax: tempMax,
                    desc: response.weather.first?.description ?? "Unknown",
                    iconName: iconName,
                    sunrise: response.sys.sunrise,
                    sunset: response.sys.sunset
                )
            }
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}



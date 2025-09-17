//
//  LocationsViewModel.swift
//  MonoWeatherApp
//
//  Created by mac on 14.09.2025.
//

import Foundation
import Combine
import UIKit

class LocationsViewModel: ObservableObject {
    @Published var cities: [CityModel] = []
    private let weatherService: WeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.weatherService = WeatherService(apiKey: Config.apiKey)
    }
    
    func loadCities() {
        let coordinates = [
            (lat: 50.4500336, lon: 30.5241361), // Kyiv
            (lat: 49.84, lon: 24.03), // Lviv
            (lat: 46.48, lon: 30.74),  // Odesa
            (lat: 48.464718, lon: 35.046185),  // Dnipro
            (lat: 48.015884, lon: 37.802849),  // Donetsk
            (lat: 47.846458, lon: 35.149269),  // Zaporizhzhia
            (lat: 44.616650, lon: 33.5253684),  // Sevastopol
        ]
        Publishers.MergeMany(coordinates.map { coord in
            weatherService.fetchWeather(lat: Float(coord.lat), lon: Float(coord.lon))
        })
        .collect()
        .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] cities in
            self?.cities = cities
        })
        .store(in: &cancellables)
    }
    
    func addCity(name: String, lat: Float, lon: Float, temp: String, tempMin: String, tempMax: String, desc: String, icon: String?, sunrise: Int, sunset: Int) {
        let newCity = CityModel(name: name, lat: lat, lon: lon, temp: temp, tempMin: tempMin, tempMax: tempMax, desc: desc, iconName: icon, sunrise: sunrise, sunset: sunset)
        cities.append(newCity)
    }
}

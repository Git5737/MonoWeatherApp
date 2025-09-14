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
    private let weatherService = WeatherService()
    private var cancellables = Set<AnyCancellable>()
    
    func loadCities() {
        let coordinates = [
            (lat: 50.4500336, lon: 30.5241361), // Kyiv
            (lat: 49.84, lon: 24.03), // Lviv
            (lat: 46.48, lon: 30.74)  // Odesa
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
    
    func addCity(name: String, temp: String, tempMin: String, tempMax: String, desc: String, icon: UIImage?, sunrise: Int, sunset: Int) {
        let newCity = CityModel(name: name, temp: temp, tempMin: tempMin, tempMax: tempMax, desc: desc, icon: icon, sunrise: sunrise, sunset: sunset)
        cities.append(newCity)
    }
}

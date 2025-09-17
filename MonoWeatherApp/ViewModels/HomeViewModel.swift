//
//  HomeViewModel.swift
//  MonoWeatherApp
//
//  Created by mac on 15.09.2025.
//

import Foundation
import Combine
import UIKit

class HomeViewModel: ObservableObject {
    @Published var cityData: CityModel?
    private let weatherService: WeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.weatherService = WeatherService(apiKey: Config.apiKey)
    }
    
    func loadCityData(lat: Float, lon: Float) {
        weatherService.fetchWeather(lat: lat, lon: lon)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] city in
                self?.cityData = city
            })
            .store(in: &cancellables)
    }
}

//
//  HomeController.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit
import Combine

class HomeController: BaseController {
    private let viewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    let cityTitle: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.primary
        label.font =  R.Fonts.helveticaRegular(with: 18)
        
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Home.currentLocation
        label.textColor = R.Colors.secondary
        label.font = R.Fonts.helveticaRegular(with: 10)
        
        return label
    }()
    
    let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    
    var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(R.Images.Home.gearshape, for: .normal)
        button.tintColor = R.Colors.secondary
        
        return button
    }()
    
    var mapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(R.Images.Home.map, for: .normal)
        button.tintColor = R.Colors.secondary
        
        return button
    }()
    
    let infoView = InfoView()
}

extension HomeController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSelectedCityData()
    }
}

extension HomeController {
    private func loadSelectedCityData() {
        let lat: Float = UserDefaults.standard.float(forKey: "selectedLat")
        let lon: Float = UserDefaults.standard.float(forKey: "selectedLon")
        viewModel.loadCityData(lat: lat, lon: lon)
    }
    
    private func bindViewModel() {
        viewModel.$cityData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] city in
                if let city = city {
                    self?.cityTitle.text = city.name
                    self?.infoView.updateTemperature(city.temp)
                    self?.infoView.updateWeatherIcon(city.iconName ?? "sun.max")
                    self?.infoView.updateWeatherTitle(city.desc)
                    self?.infoView.updateMinMaxTemp(min: city.tempMin, max: city.tempMax)
                    self?.infoView.updateSunTimes(sunriseTime: self?.formatTime(city.sunrise) ?? "", sunsetTime: self?.formatTime(city.sunset) ?? "")
                    self?.infoView.updateDate(Date())
                }
            }
            .store(in: &cancellables)
    }
    
    private func formatTime(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    @objc private func didTapSettingsButton() {
        navigationItem.backButtonTitle = R.Strings.Locations.settings
        navigationController?.navigationBar.tintColor = R.Colors.primary
        navigationController?.pushViewController(SettingsController(), animated: true)
    }
    
    @objc private func didTapMapButton() {
        navigationItem.backButtonTitle = R.Strings.Locations.selectCity
        navigationController?.navigationBar.tintColor = R.Colors.primary
        navigationController?.pushViewController(LocationsController(), animated: true)
    }
}


extension HomeController {
    
    override func setupViews() {
        super.setupViews()
        
        titleStack.addArrangedSubview(cityTitle)
        titleStack.addArrangedSubview(subtitle)
        
        view.addSubview(infoView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        settingsButton.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        mapButton.addTarget(self, action: #selector(didTapMapButton), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleStack)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: settingsButton),
            UIBarButtonItem(customView: mapButton),
        ]
        
        bindViewModel()
        loadSelectedCityData()
        
    }
}

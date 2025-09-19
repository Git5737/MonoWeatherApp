//
//  LocationsController.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit
import Combine

class LocationsController: BaseController {
    
    private let viewModel = LocationsViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Images.Locations.add, for: .normal)
        button.tintColor = R.Colors.primary
        
        return button
    }()
    
    private func bindViewModel() {
        viewModel.$cities
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    @objc private func didTapAddButton() {
        viewModel.addCity(name: "Kharkiv", lat: 49.9935, lon: 36.2304, temp: "22°C", tempMin: "18°C", tempMax: "25°C", desc: "Light Drizzle", icon: "cloud.rain", sunrise: 1699999999, sunset: 1700039999)
    }
}

extension LocationsController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func configureAppearance() {
       super.configureAppearance()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.reuseId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        
        bindViewModel()
        viewModel.loadCities()
    }
}


// MARK: - UITableViewDelegate
extension LocationsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = viewModel.cities[indexPath.row]
    
        UserDefaults.standard.set(selectedCity.lat, forKey: "selectedLat")
        UserDefaults.standard.set(selectedCity.lon, forKey: "selectedLon")
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource
extension LocationsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.reuseId, for: indexPath) as! CityCell
        let city = viewModel.cities[indexPath.row]
        cell.configure(city: city.name, temp: city.temp, desc: city.desc, icon: city.iconName)
        return cell
    }
}


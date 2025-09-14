//
//  LocationsController.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit

class LocationsController: BaseController {
    
    private var cities = LocationData.cities
    
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
    
    func addCity(name: String, temp: String, desc: String, icon: UIImage?) {
            cities.append((name, temp, desc, icon))
            tableView.reloadData()
    }
    
    @objc private func didTapAddButton() {
        addCity(name: "Kharkiv", temp: "22°C", desc: "Light Drizzle", icon: UIImage(systemName: "cloud.rain"))
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
    }
}


// MARK: - UITableViewDelegate
extension LocationsController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension LocationsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.reuseId, for: indexPath) as! CityCell
        let city = cities[indexPath.row]
        cell.configure(city: city.name, temp: city.temp, desc: city.desc, icon: city.icon)
        return cell
    }
}


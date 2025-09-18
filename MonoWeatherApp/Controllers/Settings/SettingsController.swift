//
//  SettingsController.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit

class SettingsController: BaseController {
    
    private var settings = SettingsData.settings

    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        return view
    }()
}

extension SettingsController {
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(tableView)
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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
    }
}

// MARK: - UITableViewDataSource
extension SettingsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sec = Section(rawValue: section)!
        return settings[sec]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sec = Section(rawValue: indexPath.section)!
        let item = settings[sec]![indexPath.row]
        let section = Section(rawValue: indexPath.section)!
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SettingsCell",
            for: indexPath
        ) as! SettingsCell
       
        cell.configure(title: item.title, subtitle: item.subtitle ?? "", accessory: .none)
        
        if section == .theme {
            let currentTheme = ThemeManager.shared.currentTheme
            if indexPath.row == 0 && currentTheme == .dark {
                cell.accessoryType = .checkmark
            } else if indexPath.row == 1 && currentTheme == .light {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)?.title
    }
}

// MARK: - UITableViewDelegate
extension SettingsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sec = Section(rawValue: indexPath.section)!
        
        switch sec {
        case .theme:
            ThemeManager.shared.currentTheme = (indexPath.row == 0) ? .dark : .light
            tableView.reloadSections(IndexSet(integer: Section.theme.rawValue), with: .automatic)
            
        case .feedback:
            if indexPath.row == 0 {
                print("Report an Issue tapped")
            } else {
                print("Rate on App Store tapped")
            }
            
        case .about:
            if indexPath.row == 0 {
                print("About Weather tapped")
            } else {
                print("The Team tapped")
            }
        }
    }
}

//
//  SettingsController.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit

enum Section: Int, CaseIterable {
    case theme, feedback, about
}

class SettingsController: BaseController {
    
    enum Section: Int, CaseIterable {
        case theme, feedback, about
        
        var title: String {
            switch self {
            case .theme: return "Theme"
            case .feedback: return "Feedback"
            case .about: return "About"
            }
        }
    }
    
    struct SettingItem {
        let title: String
        let subtitle: String?
        var accessory: UITableViewCell.AccessoryType
    }

    var settings: [Section: [SettingItem]] = [
        .theme: [
            SettingItem(title: "Dark Theme", subtitle: "Join the Dark Side!", accessory: .none),
            SettingItem(title: "Light Theme", subtitle: "Let There be Light!", accessory: .checkmark)
        ],
        .feedback: [
            SettingItem(title: "Report an Issue", subtitle: "Facing an issue? Report and we’ll look into it.", accessory: .disclosureIndicator),
            SettingItem(title: "Rate on App Store", subtitle: "Enjoying the app? Leave a review on the App Store.", accessory: .disclosureIndicator)
        ],
        .about: [
            SettingItem(title: "About Weather", subtitle: "Read a bit more about the app.", accessory: .disclosureIndicator),
            SettingItem(title: "The Team", subtitle: "Get to know the team that made Weather a reality.", accessory: .disclosureIndicator)
        ]
    ]

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sec = Section(rawValue: indexPath.section)!
        let item = settings[sec]![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        cell.configure(title: item.title, subtitle: item.subtitle ?? "", accessory: item.accessory)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)?.title
    }
}

// MARK: - UITableViewDelegate
extension SettingsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sec = Section(rawValue: indexPath.section)!
        
        switch sec {
        case .theme:
            // Приклад: оновлюємо галочку
            for i in 0..<settings[.theme]!.count {
                settings[.theme]![i].accessory = (i == indexPath.row) ? .checkmark : .none
            }
            tableView.reloadSections(IndexSet(integer: Section.theme.rawValue), with: .automatic)
            
            if indexPath.row == 0 {
                ThemeManager.shared.currentTheme = .dark
            } else {
                ThemeManager.shared.currentTheme = .light
            }
            
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


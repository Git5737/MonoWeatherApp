//
//  SettingsModel.swift
//  MonoWeatherApp
//
//  Created by mac on 14.09.2025.
//

import UIKit

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

struct SettingsData {
    static var settings: [Section: [SettingItem]] = [
        .theme: [
            SettingItem(title: R.Strings.Settings.darkThemeTitle, subtitle: R.Strings.Settings.darkThemeSubtitle, accessory: .none),
            SettingItem(title: R.Strings.Settings.lightThemeTitle, subtitle: R.Strings.Settings.lightThemeSubtitle, accessory: .checkmark)
        ],
        .feedback: [
            SettingItem(title: R.Strings.Settings.reportIssueTitle, subtitle: R.Strings.Settings.reportIssueSubtitle, accessory: .disclosureIndicator),
            SettingItem(title: R.Strings.Settings.rateTitle, subtitle: R.Strings.Settings.rateSubtitle, accessory: .disclosureIndicator)
        ],
        .about: [
            SettingItem(title: R.Strings.Settings.aboutTitle, subtitle: R.Strings.Settings.aboutSubtitle, accessory: .disclosureIndicator),
            SettingItem(title: R.Strings.Settings.teamTitle, subtitle: R.Strings.Settings.teamSubtitle, accessory: .disclosureIndicator)
        ]
    ]

}

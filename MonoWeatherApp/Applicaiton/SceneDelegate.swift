//
//  SceneDelegate.swift
//  MonoWeatherApp
//
//  Created by mac on 12.09.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController =  UINavigationController(rootViewController: HomeController())
        window?.makeKeyAndVisible()
    }
}


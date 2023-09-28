//
//  SceneDelegate.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
        
        ExternalService.shared.request { [weak self] url in
            if let url = url {
                DispatchQueue.main.async {
                    let splashViewController = SplashViewController(url: url)
                    self?.window?.rootViewController = splashViewController
                }
            } else {
                if !AppStorage.isOnboardingShowed {
                    let mainViewController = MainViewController()
                    let navigationController = UINavigationController(rootViewController: mainViewController)
                    navigationController.isNavigationBarHidden = true
                    self?.window?.rootViewController = navigationController
                } else {
                    let mainViewController = MainViewController()
                    let navigationController = UINavigationController(rootViewController: mainViewController)
                    navigationController.isNavigationBarHidden = true
                    self?.window?.rootViewController = navigationController
                }
            }
        }
    }
}

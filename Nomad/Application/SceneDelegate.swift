//
//  SceneDelegate.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigation: UINavigationController!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = SplashViewController()
        window?.makeKeyAndVisible()
    
        ExternalService.shared.request { [weak self] url in
            if let url = url {
                self?.window?.rootViewController = LoadingViewController(url: url)
            } else {
                if !AppStorage.isOnboardingShowed {
                    self?.navigation = UINavigationController(
                        rootViewController: MainViewController()
                    )
                }
                self?.window?.rootViewController = self?.navigation
            }
        }
    }
}

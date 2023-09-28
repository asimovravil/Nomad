//
//  RootViewController.swift
//  Nomad
//
//  Created by Ravil on 28.09.2023.
//

import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let splashViewController = SplashViewController()
        addChild(splashViewController)
        view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: self)
        
        ExternalService.shared.request { [weak self] url in
            if let url = url {
                DispatchQueue.main.async {
                    let loadingViewController = LoadingViewController(url: url)
                    
                    // Set the completion handler
                    loadingViewController.loadingCompletion = { [weak self] in
                        // Content loading in LoadingViewController is completed,
                        // switch to MainViewController
                        let mainViewController = MainViewController()
                        let navigationController = UINavigationController(rootViewController: mainViewController)
                        navigationController.isNavigationBarHidden = true
                        self?.transition(to: navigationController)
                    }
                    
                    self?.transition(to: loadingViewController)
                }
            } else {
            }
        }
    }
    
    func transition(to child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}

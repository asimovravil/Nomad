//
//  AppImage.swift
//  Moony Journey
//
//  Created by Ravil on 27.09.2023.
//

import Foundation
import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
}

enum AppImage: String, AppImageProtocol {
    
    // MARK: - Main
    
    case background
    case nomadLogo
    case playButton
    case vibratorButton
    case settingsButton
    case infoButton
    
    // MARK: - Info
    
    case infoImage
}

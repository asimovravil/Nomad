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
    
    // MARK: - AppImage
    
    case answer1
    case answer2
    case answer3
    case answer4
    case answer5
    case answer6
    case background
    case close
    case oneHeart
    case twoHearts
    case threeHearts
    case burgerMenu
    case arrowRight
    
    // MARK: - Main
    
    case nomadLogo
    case playButton
    case vibratorButton
    case settingsButton
    case infoButton
    case vibratorClose
    
    // MARK: - Levels
    
    case coinMini
    case startLevel
    case coin400
    case coin500
    
    // MARK: - LevelsAnswers
    
    case diamondAnswer
    case topazAnswer
    case quartzAnswer
    case emeraldAnswer
    case rubyAnswer
    case sapphireAnswer
    
    // MARK: - Info
    
    case infoImage
    
    // MARK: - Settings
    
    case camera
    case settingsRate
    case settingsShare
    case settingsPrivacy
    case settingsDelete
    
    // MARK: - Pause
    
    case pauseContinue
    case pauseRestart
    case pauseInfo
    case pauseHome
    
    // MARK: - BonusGame
    
    case bonusGameLogo
    case correct
    case correctAnswer
    
    // MARK: - Win
    
    case winFeat
    case winMenu
    case winNextLevel
    case coin
    case winYou
    
    // MARK: - Lose
    
    case loseYou
    case menuLose
    case tryAgain
}

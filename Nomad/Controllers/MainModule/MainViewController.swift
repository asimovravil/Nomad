//
//  MainViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private var isVibratorActive = false
    
    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nomadLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.nomadLogo.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.playButton.uiImage, for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var vibratorButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.vibratorButton.uiImage, for: .normal)
        button.addTarget(self, action: #selector(vibratorButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.infoButton.uiImage, for: .normal)
        button.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.settingsButton.uiImage, for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, nomadLogoImage, playButton, vibratorButton, infoButton, settingsButton].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        nomadLogoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(93)
            make.leading.equalToSuperview().offset(59)
            make.trailing.equalToSuperview().offset(-59)
        }
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-204)
        }
        vibratorButton.snp.makeConstraints { make in
            make.top.equalTo(playButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(24)
        }
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(playButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(playButton.snp.bottom).offset(40)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Actions
    
    @objc private func playButtonTapped() {
        let controller = LevelsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func vibratorButtonTapped() {
        if isVibratorActive {
            turnOffVibration()
            vibratorButton.setImage(AppImage.vibratorButton.uiImage, for: .normal)
        } else {
            turnOnVibration()
            vibratorButton.setImage(AppImage.vibratorClose.uiImage, for: .normal)
        }
        isVibratorActive.toggle()
    }
    
    private func turnOnVibration() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
    }
    
    private func turnOffVibration() {
        print("turn off vibration")
    }
    
    @objc private func infoButtonTapped() {
        let controller = InfoViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func settingsButtonTapped() {
        let controller = SettingsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


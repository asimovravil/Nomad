//
//  WinViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class WinViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var winFeatImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.winFeat.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var winYouImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.winYou.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var scoreTitle: UILabel = {
        let label = UILabel()
        label.text = "Your Score"
        label.textColor = AppColor.settingsColor.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var coinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.coin.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var scoreSubtitle: UILabel = {
        let label = UILabel()
        label.text = "+65"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Bold", size: 42)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var guessedTitle: UILabel = {
        let label = UILabel()
        label.text = "Guessed"
        label.textColor = AppColor.settingsColor.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var guessedSubtitle: UILabel = {
        let label = UILabel()
        label.text = "6/6"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Bold", size: 42)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.winMenu.uiImage, for: .normal)
        button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextLevelButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.winNextLevel.uiImage, for: .normal)
        button.addTarget(self, action: #selector(nextLevelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, winFeatImage, winYouImage, scoreTitle, coinImage, scoreSubtitle, guessedTitle, guessedSubtitle, menuButton, nextLevelButton].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        winFeatImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        winYouImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(47)
            make.centerX.equalToSuperview()
        }
        scoreTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(359)
            make.centerX.equalToSuperview()
        }
        coinImage.snp.makeConstraints { make in
            make.top.equalTo(scoreTitle.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(125)
        }
        scoreSubtitle.snp.makeConstraints { make in
            make.top.equalTo(scoreTitle.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-125)
        }
        guessedTitle.snp.makeConstraints { make in
            make.top.equalTo(scoreSubtitle.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        guessedSubtitle.snp.makeConstraints { make in
            make.top.equalTo(guessedTitle.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        menuButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-128)
            make.height.equalTo(51)
        }
        nextLevelButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-128)
            make.height.equalTo(51)
        }
    }
    
    // MARK: - Action
    
    @objc private func menuButtonTapped() {
        let controller = MainViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func nextLevelButtonTapped() {
    }
}

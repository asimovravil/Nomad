//
//  BonusGameViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class BonusGameViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var bonusGameImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.bonusGameLogo.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var riddleTitle: UILabel = {
        let label = UILabel()
        label.text = "Solve The Riddle"
        label.textColor = AppColor.settingsColor.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var riddleSubTitle: UILabel = {
        let label = UILabel()
        label.text = "I am always hungry, but I never eat. I can grow, but I'm never green. What am I?"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var firstAnswerButton: UIButton = {
        let button = UIButton()
        let backgroundColor = UIColor.white.withAlphaComponent(0.1)
        button.setTitle("Time", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.layer.cornerRadius = 26
        button.backgroundColor = backgroundColor
        button.addTarget(self, action: #selector(firstAnswerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondAnswerButton: UIButton = {
        let button = UIButton()
        let backgroundColor = UIColor.white.withAlphaComponent(0.1)
        button.setTitle("A wolf", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.layer.cornerRadius = 26
        button.backgroundColor = backgroundColor
        button.addTarget(self, action: #selector(secondAnswerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var correctImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.correct.uiImage
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var wrongAnswerTitle: UILabel = {
        let label = UILabel()
        label.text = "Wrong Answer!"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        label.numberOfLines = 0
        label.isHidden = true
        return label
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
        [backgroundView, bonusGameImage, correctImageView, riddleTitle, riddleSubTitle, firstAnswerButton, secondAnswerButton, wrongAnswerTitle].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bonusGameImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(47)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
        riddleTitle.snp.makeConstraints { make in
            make.top.equalTo(bonusGameImage.snp.bottom).offset(64)
            make.centerX.equalToSuperview()
        }
        riddleSubTitle.snp.makeConstraints { make in
            make.top.equalTo(riddleTitle.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        firstAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(riddleSubTitle.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(51)
        }
        secondAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(firstAnswerButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(51)
        }
        correctImageView.snp.makeConstraints { make in
            make.top.equalTo(secondAnswerButton.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
        }
        wrongAnswerTitle.snp.makeConstraints { make in
            make.top.equalTo(secondAnswerButton.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: AppImage.close.uiImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.rightBarButtonItem = backButton
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Actions
    
    @objc private func infoButtonTapped() {
        let controller = InfoViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func settingsButtonTapped() {
        let controller = SettingsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func backButtonTapped() {
        
    }
    
    @objc private func firstAnswerButtonTapped() {
        firstAnswerButton.backgroundColor = AppColor.green.uiColor
        
        UIView.transition(with: correctImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.correctImageView.isHidden = false
        }, completion: nil)
        secondAnswerButton.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let controller = MainViewController()
            controller.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @objc private func secondAnswerButtonTapped() {
        secondAnswerButton.backgroundColor = AppColor.red.uiColor
        
        UIView.transition(with: wrongAnswerTitle, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.wrongAnswerTitle.isHidden = false
        }, completion: nil)
        firstAnswerButton.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let controller = MainViewController()
            controller.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

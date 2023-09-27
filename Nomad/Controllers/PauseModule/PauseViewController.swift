//
//  PauseViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class PauseViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var continuePauseButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.pauseContinue.uiImage, for: .normal)
        button.addTarget(self, action: #selector(continuePauseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var restartPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.pauseRestart.uiImage, for: .normal)
        button.addTarget(self, action: #selector(restartPauseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var infoPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.pauseInfo.uiImage, for: .normal)
        button.addTarget(self, action: #selector(infoPauseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var homePauseButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.pauseHome.uiImage, for: .normal)
        button.addTarget(self, action: #selector(homePauseButtonTapped), for: .touchUpInside)
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
        [backgroundView, continuePauseButton, restartPauseButton, infoPauseButton, homePauseButton].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        continuePauseButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(296)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        restartPauseButton.snp.makeConstraints { make in
            make.top.equalTo(continuePauseButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        infoPauseButton.snp.makeConstraints { make in
            make.top.equalTo(restartPauseButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        homePauseButton.snp.makeConstraints { make in
            make.top.equalTo(infoPauseButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "MENU"
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        titleLabel.textColor = AppColor.white.uiColor
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: - Action
    
    @objc private func continuePauseButtonTapped() {
    }
    
    @objc private func restartPauseButtonTapped() {
    }
    
    @objc private func infoPauseButtonTapped() {
        let controller = InfoViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func homePauseButtonTapped() {
        let controller = MainViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//
//  DiamondExplosionViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class DiamondExplosionViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var heartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.threeHearts.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var burgerMenuButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.burgerMenu.uiImage, for: .normal)
        return button
    }()
    
    public lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "What is the hardest naturally occurring mineral on Earth?"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var variantTextField: UITextField = {
        let textField = UITextField()
        let rightArrowImageView = UIImageView(image: AppImage.arrowRight.uiImage)
        let rightArrowView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 0))
        textField.placeholder = "Type Your Variant..."
        textField.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        textField.borderStyle = .none
        textField.textColor = AppColor.settingsColor.uiColor
        textField.keyboardType = .default
        textField.backgroundColor = AppColor.settingsColor.uiColor.withAlphaComponent(0.1)
        textField.layer.cornerRadius = 26
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        rightArrowView.addSubview(rightArrowImageView)
        rightArrowImageView.center = rightArrowView.center
        textField.rightView = rightArrowView
        textField.rightViewMode = .always
        return textField
    }()


    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, heartImage, burgerMenuButton, questionLabel, variantTextField].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        heartImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(71)
            make.leading.equalToSuperview().offset(24)
        }
        burgerMenuButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-24)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(128)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        variantTextField.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
    }
}

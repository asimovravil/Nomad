//
//  DiamondExplosionViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class DiamondExplosionViewController: UIViewController {
    
    private let correctAnswer1 = "Diamond"
    private let correctAnswer2 = "Topaz"
    private let correctAnswer3 = "Quartz"
    private let correctAnswer4 = "Emerald"
    private let correctAnswer5 = "Ruby"
    private let correctAnswer6 = "Sapphire"
    private var isForwardButtonTapped = false
    private var correctAnswersCount = 0
    private var remainingHearts = 3
    
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
        button.addTarget(self, action: #selector(burgerMenuButtonTapped), for: .touchUpInside)
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
        textField.placeholder = "Type Your Variant..."
        textField.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        textField.borderStyle = .none
        textField.textColor = AppColor.settingsColor.uiColor
        textField.keyboardType = .default
        textField.backgroundColor = AppColor.settingsColor.uiColor.withAlphaComponent(0.1)
        textField.layer.cornerRadius = 26
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var arrowRightButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.arrowRight.uiImage, for: .normal)
        button.addTarget(self, action: #selector(arrowRightButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var answerOneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.answer1.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var answerTwoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.answer2.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var answerThreeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.answer3.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var answerFourImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.answer4.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var answerFiveImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.answer5.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var answerSixImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.answer6.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        let burgerMenuBarButtonItem = UIBarButtonItem(customView: burgerMenuButton)
        navigationItem.rightBarButtonItem = burgerMenuBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, heartImage, burgerMenuButton, questionLabel, variantTextField, arrowRightButton, answerOneImage, answerTwoImage, answerThreeImage, answerFourImage, answerFiveImage, answerSixImage].forEach() {
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
        arrowRightButton.snp.makeConstraints { make in
            make.top.equalTo(variantTextField.snp.top).offset(16)
            make.trailing.equalTo(variantTextField.snp.trailing).offset(-16)
            make.bottom.equalTo(variantTextField.snp.bottom).offset(-16)
        }
        answerOneImage.snp.makeConstraints { make in
            make.top.equalTo(variantTextField.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        answerTwoImage.snp.makeConstraints { make in
            make.top.equalTo(answerOneImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        answerThreeImage.snp.makeConstraints { make in
            make.top.equalTo(answerTwoImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        answerFourImage.snp.makeConstraints { make in
            make.top.equalTo(answerThreeImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        answerFiveImage.snp.makeConstraints { make in
            make.top.equalTo(answerFourImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        answerSixImage.snp.makeConstraints { make in
            make.top.equalTo(answerFiveImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    // MARK: - Actions
    
    @objc private func burgerMenuButtonTapped() {
        let controller = PauseViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func arrowRightButtonTapped() {
        isForwardButtonTapped = true
        textFieldDidChange(variantTextField)
        
        // Если ответ неправильный, уменьшаем количество оставшихся сердец
        if !isAnswerCorrect() {
            remainingHearts -= 1
            
            // Проверяем, остались ли еще сердца
            if remainingHearts == 0 {
                // Создаем контроллер LoseViewController
                let loseController = LoseViewController()
                
                // Устанавливаем значение guessedSubtitle
                loseController.guessedSubtitleText = "\(correctAnswersCount)/6"
                
                // Переходим на LoseViewController
                self.navigationController?.pushViewController(loseController, animated: true)
            } else {
                // Обновляем изображение сердец в соответствии с количеством оставшихся жизней
                updateHeartsImage()
            }
        }
    }

    
    private func isAnswerCorrect() -> Bool {
        if let enteredText = variantTextField.text?.lowercased() {
            return enteredText == correctAnswer1.lowercased() || enteredText == correctAnswer2.lowercased() || enteredText == correctAnswer3.lowercased() || enteredText == correctAnswer4.lowercased() || enteredText == correctAnswer5.lowercased() || enteredText == correctAnswer6.lowercased()
        }
        return false
    }
    
    private func updateHeartsImage() {
        switch remainingHearts {
        case 3:
            heartImage.image = AppImage.threeHearts.uiImage
        case 2:
            heartImage.image = AppImage.twoHearts.uiImage
        case 1:
            heartImage.image = AppImage.oneHeart.uiImage
        default:
            break
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if isForwardButtonTapped {
            if let enteredText = textField.text?.lowercased() {
                let answerImages: [String: UIImage?] = [
                    correctAnswer1.lowercased(): AppImage.diamondAnswer.uiImage,
                    correctAnswer2.lowercased(): AppImage.topazAnswer.uiImage,
                    correctAnswer3.lowercased(): AppImage.quartzAnswer.uiImage,
                    correctAnswer4.lowercased(): AppImage.emeraldAnswer.uiImage,
                    correctAnswer5.lowercased(): AppImage.rubyAnswer.uiImage,
                    correctAnswer6.lowercased(): AppImage.sapphireAnswer.uiImage
                ]
                let answerImageSlots: [String: UIImageView] = [
                    correctAnswer1.lowercased(): answerOneImage,
                    correctAnswer2.lowercased(): answerTwoImage,
                    correctAnswer3.lowercased(): answerThreeImage,
                    correctAnswer4.lowercased(): answerFourImage,
                    correctAnswer5.lowercased(): answerFiveImage,
                    correctAnswer6.lowercased(): answerSixImage
                ]
                if let image = answerImages[enteredText], let answerImageView = answerImageSlots[enteredText] {
                    answerImageView.image = image
                    if enteredText == correctAnswer1.lowercased() || enteredText == correctAnswer2.lowercased() || enteredText == correctAnswer3.lowercased() || enteredText == correctAnswer4.lowercased() || enteredText == correctAnswer5.lowercased() || enteredText == correctAnswer6.lowercased() {
                        correctAnswersCount += 1
                        if correctAnswersCount == 6 {
                            let controller = WinViewController()
                            self.navigationController?.pushViewController(controller, animated: true)
                        }
                    }
                }
            }
            isForwardButtonTapped = false
        }
    }
}

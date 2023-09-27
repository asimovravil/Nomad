//
//  LevelsTableViewCell.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class LevelsTableViewCell: UITableViewCell {

    static let reuseID = String(describing: LevelsTableViewCell.self)
    var playButtonTappedHandler: (() -> Void)?
    
    // MARK: - UI
    
    public lazy var levelName: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var guessedTitle: UILabel = {
        let label = UILabel()
        label.text = "Guessed:"
        label.textColor = AppColor.settingsColor.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var guessedSubtitle: UILabel = {
        let label = UILabel()
        label.text = "0/6"
        label.textColor = AppColor.settingsColor.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var earnedTitle: UILabel = {
        let label = UILabel()
        label.text = "Earned:"
        label.textColor = AppColor.settingsColor.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var coinMiniImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.coinMini.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var earnedSubTitle: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = AppColor.settingsColor.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.startLevel.uiImage, for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Property
    
    var namelevel: String? {
        didSet {
            levelName.text = namelevel
        }
    }
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [levelName, guessedTitle, guessedSubtitle, earnedTitle, coinMiniImage, earnedSubTitle, playButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        levelName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        guessedTitle.snp.makeConstraints { make in
            make.top.equalTo(levelName.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        guessedSubtitle.snp.makeConstraints { make in
            make.top.equalTo(levelName.snp.bottom).offset(8)
            make.leading.equalTo(guessedTitle.snp.trailing).offset(8)
        }
        earnedTitle.snp.makeConstraints { make in
            make.top.equalTo(levelName.snp.bottom).offset(8)
            make.leading.equalTo(guessedSubtitle.snp.trailing).offset(16)
        }
        coinMiniImage.snp.makeConstraints { make in
            make.top.equalTo(levelName.snp.bottom).offset(8)
            make.leading.equalTo(earnedTitle.snp.trailing).offset(8.5)
        }
        earnedSubTitle.snp.makeConstraints { make in
            make.top.equalTo(levelName.snp.bottom).offset(8)
            make.leading.equalTo(coinMiniImage.snp.trailing).offset(4)
        }
        playButton.snp.makeConstraints { make in
            make.top.equalTo(guessedTitle.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    // MARK: - Actions
    
    @objc private func playButtonTapped() {
        playButtonTappedHandler?()
    }
}

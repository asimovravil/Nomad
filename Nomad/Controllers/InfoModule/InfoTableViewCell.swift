//
//  InfoTableViewCell.swift
//  Nomad
//
//  Created by Ravil on 29.09.2023.
//

import UIKit
import SnapKit

final class InfoTableViewCell: UITableViewCell {

    static let reuseID = String(describing: InfoTableViewCell.self)

    // MARK: - UI
    
    public lazy var firstInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "The goal of the participants of the game is to guess the most common answers of people to the proposed questions, to which it is impossible to give an unambiguous objective answer, for example, \"What kind of food do the French like the most?\""
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var levelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.levelInfo.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public lazy var secondInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "You will only have 3 chances to miss the answer. The game will end in the case of all open answers or when all lives are spent."
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var heartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.heartInfo.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public lazy var thirdInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "The answers are sometimes completely unpredictable and very funny."
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
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
        [firstInfoLabel, levelImage, secondInfoLabel, heartImage, thirdInfoLabel].forEach() {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        firstInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        levelImage.snp.makeConstraints { make in
            make.top.equalTo(firstInfoLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
        }
        secondInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(levelImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        heartImage.snp.makeConstraints { make in
            make.top.equalTo(secondInfoLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
        }
        thirdInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(heartImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}

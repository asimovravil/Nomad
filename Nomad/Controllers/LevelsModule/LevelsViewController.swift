//
//  LevelsViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class LevelsViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(LevelsTableViewCell.self, forCellReuseIdentifier: LevelsTableViewCell.reuseID)
        tableView.layer.cornerRadius = 26
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = AppColor.settingsColor.uiColor.withAlphaComponent(0.1)
        tableView.rowHeight = 160
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private lazy var coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.coinMini.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var coinSubtitle: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "SFProDisplay-Bold", size: 16)
        label.numberOfLines = 0
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
        [backgroundView, tableView, coinImageView, coinSubtitle].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - setupConstraints
        
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(149)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-24)
        }
        coinImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().offset(-62)
        }
        coinSubtitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(68)
            make.leading.equalTo(coinImageView.snp.trailing).offset(8)
        }
    }
    
    // MARK: - setupNavigationBar
        
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "GAMES"
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        titleLabel.textColor = AppColor.white.uiColor
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension LevelsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LevelsTableViewCell.reuseID, for: indexPath) as? LevelsTableViewCell else {
            fatalError("Could not cast to LevelsTableViewCell")
        }
        if indexPath.item == 0 {
            cell.playButtonTappedHandler = { [weak self] in
                let controller = DiamondExplosionViewController()
                controller.navigationItem.hidesBackButton = true
                self?.navigationController?.pushViewController(controller, animated: true)
            }
        } else {
            cell.playButtonTappedHandler = nil
        }
        
        switch indexPath.row {
        case 0:
            cell.namelevel = "Diamond Explosion"
            cell.playButton.setImage(AppImage.startLevel.uiImage, for: .normal)
        case 1:
            cell.namelevel = "Fruits"
            cell.playButton.setImage(AppImage.startLevel.uiImage, for: .normal)
        case 2:
            cell.namelevel = "Gold Rush"
            cell.playButton.setImage(AppImage.startLevel.uiImage, for: .normal)
        case 3:
            cell.namelevel = "Mysterious Egypt"
            cell.playButton.setImage(AppImage.coin400.uiImage, for: .normal)
            cell.earnedSubTitle.text = "180"
        case 4:
            cell.namelevel = "Diamond Explosion"
            cell.playButton.setImage(AppImage.coin500.uiImage, for: .normal)
            cell.earnedSubTitle.text = "180"
        default:
            cell.namelevel = nil
        }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}





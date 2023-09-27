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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
        
    // MARK: - setupViews
        
    private func setupViews() {
        [backgroundView, tableView].forEach {
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
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}





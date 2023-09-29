//
//  SettingsViewController.swift
//  Nomad
//
//  Created by Ravil on 27.09.2023.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {

    private var savedName: String?
    
    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var cameraImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.camera.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        textField.borderStyle = .none
        textField.textColor = AppColor.settingsColor.uiColor
        textField.leftViewMode = .always
        textField.keyboardType = .default
        return textField
    }()
    
    private lazy var arrowRightButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.arrowRight.uiImage, for: .normal)
        button.addTarget(self, action: #selector(arrowRightButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var lineView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = AppColor.settingsColor.uiColor
        uiView.alpha = 0.3
        return uiView
    }()
    
    private lazy var rateButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.settingsRate.uiImage, for: .normal)
        button.addTarget(self, action: #selector(rateUsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.settingsShare.uiImage, for: .normal)
        button.addTarget(self, action: #selector(shareAppButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var privacyButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.settingsPrivacy.uiImage, for: .normal)
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.settingsDelete.uiImage, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
        
        if let savedName = UserDefaults.standard.string(forKey: "userName") {
            nameTextField.text = savedName
        }
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, cameraImage, nameTextField, arrowRightButton, lineView, rateButton, shareButton, privacyButton, deleteButton].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        cameraImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(149)
            make.leading.equalToSuperview().offset(24)
        }
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalTo(cameraImage.snp.centerY)
            make.leading.equalTo(cameraImage.snp.trailing).offset(20)
        }
        arrowRightButton.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.top).offset(16)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalTo(nameTextField.snp.bottom).offset(-16)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(3)
            make.leading.equalTo(cameraImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(1)
        }
        rateButton.snp.makeConstraints { make in
            make.top.equalTo(cameraImage.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(24)
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(cameraImage.snp.bottom).offset(40)
            make.trailing.equalToSuperview().offset(-24)
        }
        privacyButton.snp.makeConstraints { make in
            make.top.equalTo(rateButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
        }
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(shareButton.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "SETTINGS"
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        titleLabel.textColor = AppColor.white.uiColor
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - shareAppButtonTapped
    
    @objc private func shareAppButtonTapped() {
        let actionSheet = UIAlertController(title: nil, message: "Share App", preferredStyle: .actionSheet)
        let messageAction = UIAlertAction(title: "Share via Message", style: .default) { [weak self] _ in
            self?.shareAppViaMessage()
        }

        let otherAppsAction = UIAlertAction(title: "Share via Other Apps", style: .default) { [weak self] _ in
            self?.shareAppViaOtherApps()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        actionSheet.addAction(messageAction)
        actionSheet.addAction(otherAppsAction)
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true, completion: nil)
    }
    
    private func shareAppViaMessage() {
    }

    private func shareAppViaOtherApps() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!

        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: - rateUsButtonTapped
    
    @objc private func rateUsButtonTapped() {
        let appName = "Moony Journey"

        if let url = URL(string: "https://itunes.apple.com/search?term=\(appName)&entity=software") {
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let results = json["results"] as? [[String: Any]],
                           let firstResult = results.first,
                           let appID = firstResult["trackId"] as? Int {
                            self.openAppStorePage(for: appID)
                        }
                    } catch {
                        print("JSON parsing error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }

    private func openAppStorePage(for appID: Int) {
        let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review")!

        if UIApplication.shared.canOpenURL(appStoreURL) {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
        } else {
            print("Unable to open App Store URL")
        }
    }
    
    @objc private func arrowRightButtonTapped() {
        if let newName = nameTextField.text {
            UserDefaults.standard.set(newName, forKey: "userName")
        }
    }
}

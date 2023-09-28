//
//  SplashViewController.swift
//  Nomad
//
//  Created by Ravil on 28.09.2023.
//

import UIKit
import SnapKit

final class SplashViewController: UIViewController {
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nomadLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.nomadLogo.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var splashLoadingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.splashLoading.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, nomadLogoImage, splashLoadingImage].forEach() {
            view.addSubview($0)
        }
        startRotationAnimation()
    }

    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        nomadLogoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(93)
            make.leading.equalToSuperview().offset(59)
            make.trailing.equalToSuperview().offset(-59)
        }
        splashLoadingImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-184)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Action
    
    private func startRotationAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            self.splashLoadingImage.transform = self.splashLoadingImage.transform.rotated(by: .pi)
        }, completion: nil)
    }
}

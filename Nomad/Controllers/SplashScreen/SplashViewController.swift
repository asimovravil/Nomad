//
//  SplashViewController.swift
//  Nomad
//
//  Created by Ravil on 28.09.2023.
//

import UIKit
import SnapKit
import WebKit

class SplashViewController: UIViewController {

    private let url: URL
    private let isNeed: Bool
    
    // MARK: - UI
    
    private lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.applicationNameForUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1"
        if #available(iOS 14, *) {
            config.defaultWebpagePreferences.allowsContentJavaScript = true
        }
        config.allowsPictureInPictureMediaPlayback = true
        config.allowsAirPlayForMediaPlayback = true
        config.allowsInlineMediaPlayback = true
        let pref = WKWebpagePreferences()
        pref.preferredContentMode = .mobile
        config.defaultWebpagePreferences = pref
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        
        return webView
    }()
    
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
    
    init(url: URL, isNeed: Bool = true) {
        self.url = url
        self.isNeed = isNeed
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, webView, nomadLogoImage, splashLoadingImage].forEach() {
            view.addSubview($0)
        }
        loadCookie()
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        startRotationAnimation()
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        webView.snp.makeConstraints { make in
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

extension SplashViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        saveCookie()
        if
            isNeed,
            let redirectedUrl = navigationAction.request.url?.absoluteString,
            let regex = try? NSRegularExpression(pattern: "www."),
            let _ = regex.firstMatch(in: redirectedUrl, range: NSRange(location: 0, length: redirectedUrl.utf16.count))
        {
            AppStorage.url = redirectedUrl
        }
        decisionHandler(.allow)
    }
    
    private func saveCookie() {
        let cookieJar: HTTPCookieStorage = HTTPCookieStorage.shared
        if let cookies = cookieJar.cookies {
            let data: Data? = try? NSKeyedArchiver.archivedData(withRootObject: cookies, requiringSecureCoding: false)
            if let data = data {
                let userDefaults: UserDefaults = UserDefaults.standard
                userDefaults.set(data, forKey: "cookie")
            }
        }
    }
    
    func loadCookie() {
        let ud: UserDefaults = UserDefaults.standard
        let data: Data? = ud.object(forKey: "cookie") as? Data
        if let cookie = data {
            let datas: NSArray? = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: cookie)
            if let cookies = datas {
                for c in cookies {
                    if let cookieObject = c as? HTTPCookie {
                        HTTPCookieStorage.shared.setCookie(cookieObject)
                    }
                }
            }
        }
    }
}

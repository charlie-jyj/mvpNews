//
//  NewsWebViewController.swift
//  MVPNews
//
//  Created by 정유진 on 2022/09/26.
//

import WebKit
import SnapKit
import UIKit

final class NewsWebViewController: UIViewController {
    private let webView = WKWebView()
    private lazy var rightBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "link"),
        style: .plain,
        target: self,
        action: #selector(didTapRightBarButtonItem)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupWebView()
    }
}

private extension NewsWebViewController {
    func setupNavigationBar() {
        navigationItem.title = "main title"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupWebView() {
        view = webView
        guard let linkURL = URL(string: "https://fastcampus.co.kr")
        else {
            navigationController?.popViewController(animated: false)
            return
        }
        let urlRequest = URLRequest(url:linkURL)
        webView.load(urlRequest)
    
        
    }
    
    @objc func didTapRightBarButtonItem() {
        print("tap right button")
        UIPasteboard.general.string = "https://www."
    }
}

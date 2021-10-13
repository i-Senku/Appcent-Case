//
//  NewsWebVC.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import UIKit
import WebKit

final class NewsWebVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        load()
    }
    
    func load(){
        if let url = url {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }

}

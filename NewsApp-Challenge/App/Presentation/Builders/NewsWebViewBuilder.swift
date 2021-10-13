//
//  NewsWebViewBuilder.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import Foundation
import UIKit

final class NewsWebViewBuilder {
    
    static func make(url : URL?) -> NewsWebVC {
        let sb = UIStoryboard(name: "NewsDetail", bundle: .main)
        let webViewVC = sb.instantiateViewController(identifier: "NewsWebVC") as! NewsWebVC
        webViewVC.url = url
        return webViewVC
    }
}

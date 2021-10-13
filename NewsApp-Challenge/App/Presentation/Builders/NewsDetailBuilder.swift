//
//  NewsDetailVC.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import Foundation
import UIKit

final class NewsDetailBuilder {
    
    static func make(viewModel : NewsDetailViewModel) -> NewsDetailVC {
        let sb = UIStoryboard(name: "NewsDetail", bundle: .main)
        let detailVC = sb.instantiateViewController(identifier: "NewsDetailVC") as! NewsDetailVC
        detailVC.viewModel = viewModel
        return detailVC
    }
}

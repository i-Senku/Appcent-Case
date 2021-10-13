//
//  NewsListBuilder.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation
import UIKit

final class NewsListBuilder {
    
    static func make() -> UINavigationController {
        
        let sb = UIStoryboard(name: "NewsList", bundle: .main)
        let newsListVC = sb.instantiateViewController(identifier: "NewsListVC") as! NewsListVC
        
        let repository = NewsRepository(service: NewsDataService())
        let viewModel = NewsListViewModel(repository: repository)
        
        viewModel.delegate = newsListVC
        newsListVC.viewModel = viewModel
        
        let navigationController = UINavigationController(rootViewController: newsListVC)
        
        let item = UITabBarItem()
        item.title = "Home"
        item.image = UIImage(systemName: "newspaper")
        
        navigationController.tabBarItem = item
        
        return navigationController
    }
    
}

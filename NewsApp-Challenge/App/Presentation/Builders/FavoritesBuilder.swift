//
//  FavoritesBuilder.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import Foundation
import UIKit

final class FavoriteBuilder {
    static func make() -> UINavigationController {
        let sb = UIStoryboard(name: "Favorite", bundle: .main)
        let favoriteVC = sb.instantiateViewController(identifier: "FavoriteVC") as! FavoriteVC
        
        //MARK: - ViewModel
        let viewModel = FavoriteViewModel(repository: app.favoriteRepository)
        viewModel.delegate = favoriteVC
        favoriteVC.viewModel = viewModel
        
        
        //MARK: - TabBarItem
        let item = UITabBarItem()
        item.title = "Favorites"
        item.image = UIImage(systemName: "heart")
        item.selectedImage = UIImage(systemName: "heart.fill")
        
        favoriteVC.tabBarItem = item
        
        //MARK: - Navigation Controller
        let navigationController = UINavigationController(rootViewController: favoriteVC)
        navigationController.title = "Favorites"
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}

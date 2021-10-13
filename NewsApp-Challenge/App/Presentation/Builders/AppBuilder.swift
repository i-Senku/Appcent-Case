//
//  NewsListBuilder.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation
import UIKit

final class AppBuilder {
    
    static func make() -> UITabBarController {
        let tabBarVC = UITabBarController()
        
        tabBarVC.setViewControllers([
            NewsListBuilder.make(),
            FavoriteBuilder.make()
        ], animated: true)
        
        return tabBarVC
    }
}

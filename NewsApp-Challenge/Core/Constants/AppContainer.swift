//
//  AppContainer.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let newsRepository : NewsRepositoryProtocol = NewsRepository(service: NewsDataService())
    let favoriteRepository : FavoriteRepositoryProtocol = FavoriteRepository(FavoritesLocalService())
}

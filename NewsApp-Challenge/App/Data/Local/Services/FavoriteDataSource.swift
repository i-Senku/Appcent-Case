//
//  FavoriteDataSource.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import Foundation

protocol FavoritesLocalDataSource {
    func getFavorites() -> [Favorites]
    func addFavorite(item : Favorites) -> Bool
    func deleteFavorite(item : Favorites) -> Bool
    func favoriteIsAvailable(primaryKey : String) -> Favorites?
    func deleteAllFavorites() -> Bool
}

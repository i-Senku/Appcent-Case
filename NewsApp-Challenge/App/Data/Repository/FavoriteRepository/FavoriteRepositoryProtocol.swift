//
//  FavoriteRepositoryProtocol.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import Foundation

protocol FavoriteRepositoryProtocol {
    func getFavorites() -> [Favorites]
    func addFavorite(item : Article) -> Bool
    func deleteFavorite(item : Favorites) -> Bool
    func deleteFavoriteById(id : String) -> Bool
    func favoriteIsAvailable(primaryKey : String) -> Favorites?
    func deleteAllFavorites() -> Bool
}

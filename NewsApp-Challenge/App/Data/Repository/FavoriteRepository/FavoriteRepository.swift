//
//  FavoriteRepository.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import Foundation

final class FavoriteRepository : FavoriteRepositoryProtocol {
    
    var localFavoriteService : FavoritesLocalDataSource
    
    init(_ favoriteLocalDataSource : FavoritesLocalDataSource) {
        self.localFavoriteService = favoriteLocalDataSource
    }
    
    func getFavorites() -> [Favorites] {
        return localFavoriteService.getFavorites()
    }
    
    func addFavorite(item: Article) -> Bool {
        return localFavoriteService.addFavorite(item: item.toFavorite())
    }
    
    func deleteFavorite(item : Favorites) -> Bool {
        guard let url = item.url else { return false }
        let object = favoriteIsAvailable(primaryKey: url)
        if let item = object {
            return localFavoriteService.deleteFavorite(item: item)
        }else{
            return false
        }
    }
    
    func deleteFavoriteById(id: String) -> Bool {
        let item = favoriteIsAvailable(primaryKey: id)
        if let item = item {
            return deleteFavorite(item: item)
        }else{
            return false
        }
    }
    
    func deleteAllFavorites() -> Bool {
        return localFavoriteService.deleteAllFavorites()
    }
    
    func favoriteIsAvailable(primaryKey: String) -> Favorites? {
        return localFavoriteService.favoriteIsAvailable(primaryKey: primaryKey)
    }
}

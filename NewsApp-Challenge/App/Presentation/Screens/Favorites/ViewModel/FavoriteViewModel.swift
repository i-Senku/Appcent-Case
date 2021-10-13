//
//  FavoriteViewModel.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import Foundation

final class FavoriteViewModel : FavoriteViewModelProtocol {
    var delegate: FavoriteViewModelOutput?
    
    var favoriteRepository: FavoriteRepositoryProtocol
    
    init(repository : FavoriteRepositoryProtocol) {
        favoriteRepository = repository
    }
    
    var favoriteList: [Favorites] = []
    
    func loadFavorites() {
        favoriteList = favoriteRepository.getFavorites()
        delegate?.reloadTableView()
    }
    
    func didSelectItem(_ index: Int) {
        let viewModel = NewsDetailViewModel(repository: app.favoriteRepository)
        viewModel.article = favoriteList[index].toArticle()
        delegate?.navigate(route: .newsDetail(viewModel))
    }
    
    func deleteFavorite(index: Int) {
        let favoriteItem = favoriteList[index]
        let status = favoriteRepository.deleteFavorite(item: favoriteItem)
        if status {
            favoriteList.remove(at: index)
            delegate?.basicAlert(title: "Deleted", message: "Favorite item is deleted")
            delegate?.reloadTableView()
        }
    }
    
    func clear() {
        let status = favoriteRepository.deleteAllFavorites()
        if status {
            delegate?.basicAlert(title: "Cleared", message: "List Cleared Successfully")
            favoriteList.removeAll()
            delegate?.reloadTableView()
        }
    }
    
    
}

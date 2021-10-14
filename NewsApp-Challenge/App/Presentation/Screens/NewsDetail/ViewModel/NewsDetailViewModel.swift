//
//  NewsDetailViewModel.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import Foundation

final class NewsDetailViewModel : NewsDetailViewModelProtocol {
    
    weak var delegate: NewsDetailViewModelOutput?
    var article: Article?
    var favoriteRepository: FavoriteRepositoryProtocol
    var isAvailable: Bool = false
    
    init(repository : FavoriteRepositoryProtocol) {
        favoriteRepository = repository
    }
    
    func didLoad() {
        guard let url = article?.url?.description else { return }
        let favoriteItem = favoriteRepository.favoriteIsAvailable(primaryKey: url)
        if favoriteItem != nil{
            isAvailable = true
            delegate?.favoriteIsAvailable(isAvailable: true)
        }else{
            isAvailable = false
            delegate?.favoriteIsAvailable(isAvailable: false)
        }
    }
    
    func showWebView() {
        guard let article = article else { return }
        delegate?.navigate(to: .showWebView(article.url))
    }
    
    func share() {
        delegate?.share(url: article?.url)
    }
    
    func addFavorite() {
        guard let article = article else { return }
        let status = favoriteRepository.addFavorite(item: article)
        if status {
            isAvailable = true
            delegate?.favoriteIsAvailable(isAvailable: true)
            delegate?.showAlert(title: "Added", message: "This Article Added To Favorites",onAction: {
                self.delegate?.navigate(to: .back)
            })
        }
    }
    
    func removeFavorite() {
        guard let article = article else { return }
        let status = favoriteRepository.deleteFavorite(item: article.toFavorite())
        if status {
            isAvailable = false
            delegate?.favoriteIsAvailable(isAvailable: false)
            delegate?.showAlert(title: "Removed", message: "This Article Removed from Favorites",onAction: {
                
            })
        }
    }
    
    func saveOrRemoveFavorite() {
        if isAvailable {
            removeFavorite()
        }else{
            addFavorite()
        }
    }
    
}

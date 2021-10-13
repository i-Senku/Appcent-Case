//
//  NewsDetailContracts.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import Foundation

protocol NewsDetailViewModelProtocol {
    var delegate : NewsDetailViewModelOutput? { get set }
    var article : Article? { get set }
    var favoriteRepository : FavoriteRepositoryProtocol { get set }
    var isAvailable : Bool { get set }
    
    //MARK: - Functions
    func didLoad()
    func saveOrRemoveFavorite()
    func showWebView()
    func share()
    func addFavorite()
    func removeFavorite()
}

protocol NewsDetailViewModelOutput : AnyObject {
    func favoriteIsAvailable(isAvailable : Bool)
    func showAlert(title : String,message : String,onAction : @escaping ()->())
    func share(url : URL?)
    func navigate(to route : NewsDetailRoute)
}

enum NewsDetailRoute {
    case showWebView(URL?)
    case back
}

//
//  FavoriteContracts.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import Foundation

protocol FavoriteViewModelProtocol {
    var delegate : FavoriteViewModelOutput? { get set }
    var favoriteRepository : FavoriteRepositoryProtocol { get set }
    var favoriteList : [Favorites] { get set }
    
    //MARK: - Functions
    func loadFavorites()
    func didSelectItem(_ index : Int)
    func deleteFavorite(index : Int)
    func clear()
}

protocol FavoriteViewModelOutput : AnyObject{
    func reloadTableView()
    func basicAlert(title : String,message : String)
    func navigate(route : FavoriteViewModelRoute)
}

enum FavoriteViewModelRoute {
    case newsDetail(NewsDetailViewModel)
}

//
//  NewsListContracts.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

protocol NewsListViewModelProtocol {
    var delegate : NewsListViewModelOutput? { get set }
    var newsRepository : NewsRepositoryProtocol { get set }
    var newsModel : NewsModel? { get set }
    var newsList : [Article]? { get set }
    var paginableStatus : Bool { get set }
    
    var currentPage : Int { get set }
    var currentText : String { get set }
    
    //MARK: - Functions
    func didLoad()
    func search(text : String)
    func clearSearchData()
    func fetchMoreNews()
    func didSelect(index : Int)
}

protocol NewsListViewModelOutput : AnyObject {
    func reloadNewsList()
    func navigate(to route : NewsListRoute)
    func setEmptyView(title : String,message : String,isAnimate : Bool)
    func restoreEmptyView()
}

enum NewsListRoute {
    case newsDetail(NewsDetailViewModel)
}

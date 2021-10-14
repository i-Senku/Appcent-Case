//
//  NewsListViewModel.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

final class NewsListViewModel : NewsListViewModelProtocol {
    weak var delegate: NewsListViewModelOutput?
    var newsRepository: NewsRepositoryProtocol
    var newsList: [Article]?
    
    var paginableStatus = true
    var newsModel: NewsModel?
    var currentPage: Int = 1
    var currentText: String = ""
    
    init(repository : NewsRepositoryProtocol) {
        self.newsRepository = repository
    }
    
    func search(text : String) {
        currentPage = 1
        currentText = text
        newsList?.removeAll()
        newsModel = nil
        delegate?.restoreEmptyView()
        delegate?.reloadNewsList()
        delegate?.setEmptyView(title: "News Loading", message: "This process may take time, please wait...",isAnimate: true)
        
        newsRepository.search(text: text, page: currentPage) { [weak self] result in
            guard let self = self else {return}
            self.delegate?.restoreEmptyView()
            
            switch result {
            case .success(let newsModel):
                self.newsList = newsModel.articles
                self.newsModel = newsModel
                self.delegate?.reloadNewsList()
            case .failure(let error):
                self.delegate?.setEmptyView(title: "Error", message: error.message,isAnimate: false)
            }
        }
    }
    
    func fetchMoreNews() {
        if !currentText.isEmpty {
            if paginableStatus {
                if let newsModel = newsModel {
                    if newsModel.articles.count < newsModel.totalResults {
                        currentPage += 1
                        self.paginableStatus = false
                        
                        newsRepository.search(text: currentText, page: currentPage) { [weak self] result in
                            guard let self = self else {return}
                            self.paginableStatus = true
                            
                            switch result {
                            case .success(let newsModel):
                                self.newsList?.append(contentsOf: newsModel.articles)
                                self.newsModel = newsModel
                                self.delegate?.reloadNewsList()
                            case .failure(let error):
                                self.delegate?.setEmptyView(title: "Error", message: error.message,isAnimate: false)
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    func didLoad() {
        delegate?.setEmptyView(title: "Search News", message: "Lets discover new news", isAnimate: false)
    }
    
    func clearSearchData() {
        currentText = ""
        currentPage = 1
        newsList = nil
        delegate?.restoreEmptyView()
        delegate?.reloadNewsList()
    }
    
    func didSelect(index: Int) {
        let article = newsList?[index]
        let viewModel = NewsDetailViewModel(repository: app.favoriteRepository)
        viewModel.article = article
        delegate?.navigate(to: .newsDetail(viewModel))
    }
}

//
//  NewsRepository.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

final class NewsRepository : NewsRepositoryProtocol {
    let newsService : NewsServiceDataSource
    
    init(service : NewsServiceDataSource) {
        self.newsService = service
    }
    
    func search(text: String, page: Int?, completion: @escaping (Result<NewsModel, NewsError>) -> Void) {
        
        newsService.search(text: text, page: page) { result in
            switch result {
            case .success(let newsModel):
                return completion(.success(newsModel))
            case .failure(let networkError):
                print(networkError)
                return completion(.failure(networkError.toNewsError()))
            }
        }
    }
    
    
}

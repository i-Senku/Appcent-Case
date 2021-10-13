//
//  NewsDataService.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

final class NewsDataService : NewsServiceDataSource {
    
    func search(
        text: String,
        page: Int?,
        completion: @escaping (Result<NewsModel, NetworkError>) -> Void) {
        
        return NetworkExecuter.shared.execute(
            route: NewsAPI.search(text: text, page: page ?? 1),
            responseModel: NewsModel.self,
            completion: completion)
    } 
}

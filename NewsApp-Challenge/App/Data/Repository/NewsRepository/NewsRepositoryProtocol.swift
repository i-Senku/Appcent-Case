//
//  NewsRepositoryProtocol.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

protocol NewsRepositoryProtocol {
    func search(
        text : String,
        page : Int?,
        completion : @escaping (Result<NewsModel,NewsError>) -> Void)
}

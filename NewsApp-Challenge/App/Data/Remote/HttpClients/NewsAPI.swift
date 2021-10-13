//
//  NewsAPI.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

enum NewsAPI : BaseClientGenerator {
    
    case search(text : String,page : Int)
    
    var scheme: String { "https" }
    
    var host: String { "newsapi.org" }
    
    var path: String {
        switch self {
        case .search(_,_):
            return "/v2/everything"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        var queries : [URLQueryItem]?
        switch self {
        case .search(let text, let page):
            queries = [
                .init(name: "q", value: text),
                .init(name: "page", value: String(page))
            ]
        }
        queries?.append(.init(name: "apiKey", value: AppConstants.apiKey))
        return queries
    }
    
    //MARK: - Default GET
    var method: HttpMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var header: [HttpHeader]? {
        return [.contentType()]
    }
    
    //MARK: - Default Nil
    var body: [String : Any]?{
        switch self {
        default:
            return nil
        }
    }
    
    
}

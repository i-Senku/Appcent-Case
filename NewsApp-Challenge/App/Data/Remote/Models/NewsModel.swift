//
//  NewsModel.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation
import RealmSwift

struct NewsModel : Decodable {
    let status : String
    let totalResults : Int
    let articles : [Article]
}

struct Article : Decodable {
    let author : String?
    let title : String?
    let description : String?
    let urlToImage : URL?
    let publishedAt : String?
    let content : String?
    let url : URL?
    
    func toFavorite() -> Favorites {
        return Favorites(article: self)
    }
}

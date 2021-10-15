//
//  Favorite.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 15.10.2021.
//

import Foundation
import RealmSwift

class Favorites : Object {
    @Persisted var title : String?
    @Persisted var content : String?
    @Persisted var author : String?
    @Persisted var descriptionText : String?
    @Persisted var imageURL : String?
    @Persisted var publishedAt : String?
    @Persisted var url : String?

    
    convenience init(article : Article) {
        self.init()
        title = article.title
        content = article.content
        author = article.author
        descriptionText = article.description
        imageURL = article.urlToImage?.description
        publishedAt = article.publishedAt
        url = article.url?.description
    }
    
    func toArticle() -> Article {
        return Article(author: author, title: title, description: descriptionText, urlToImage: toImageUrl(), publishedAt: publishedAt, content: content, url: toUrl())
    }
    
    func toImageUrl() -> URL? {
        guard let imageURL = imageURL else { return nil}
        return URL(string: imageURL)
    }
    
    func toUrl() -> URL? {
        guard let url = url else { return nil }
        return URL(string: url)
    }
    
    override class func primaryKey() -> String? {
        "url"
    }
}


//
//  NewsApp_Test.swift
//  NewsApp-Test
//
//  Created by Ercan Garip on 13.10.2021.
//

import XCTest
@testable import NewsApp_Challenge

//MARK: - Test only for Local Service
class NewsApp_Test: XCTestCase {
    
    var favoriteLocalService : FavoritesLocalDataSource!
    var article : Article!
    var favorite : Favorites!
    
    override func setUp() {
        article = Article(author: "Ercan", title: "Title", description: "Desc", urlToImage: nil, publishedAt: nil, content: nil, url: URL(string: "https://www.google.com"))
        favorite = Favorites(article: article)
        favoriteLocalService = FavoritesLocalService()
    }
    
    func testAddFavorite() throws {
        let status = favoriteLocalService.addFavorite(item: favorite)
        XCTAssertTrue(status)
    }
    
    func testDeleteFavorite() throws {
        try testAddFavorite()
        let status = favoriteLocalService.deleteFavorite(item: favorite)
        XCTAssertTrue(status)
    }
    
    func testFavoriteList() throws {
        try testAddFavorite()
        let list = favoriteLocalService.getFavorites()
        XCTAssertEqual(list.count,1)
    }
    
    func testAvailableFavorite() throws {
        let availableFavorite = favoriteLocalService.favoriteIsAvailable(primaryKey: favorite.url!.description)
        XCTAssertNotNil(availableFavorite)
    }
    
}

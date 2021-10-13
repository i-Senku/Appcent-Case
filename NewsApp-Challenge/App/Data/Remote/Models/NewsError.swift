//
//  NewsError.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

struct NewsError : Error,Decodable {
    let status : String
    let code : String
    let message : String
}

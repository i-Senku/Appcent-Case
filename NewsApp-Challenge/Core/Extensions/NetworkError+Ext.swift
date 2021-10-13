//
//  NetworkError+Ext.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

extension NetworkError{
    
    func toNewsError() -> NewsError{
        switch self {
        case .request(let statusCode, let data):
            do {
                guard let data = data else {return NewsError(status: "error", code: statusCode.description, message: "No Data")}
                let movieError = try JSONDecoder().decode(NewsError.self, from: data)
                return movieError
            } catch {
                return NewsError(status: "error", code: "-1", message: "Network Error on Data")
            }
        default :
            return NewsError(status: "error", code: "-1", message: self.localizedDescription)
        }
    }
}

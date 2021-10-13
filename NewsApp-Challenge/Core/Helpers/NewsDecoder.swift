//
//  NewsApiDecoder.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import Foundation

public enum NewsDecoder {
    static let decoder : JSONDecoder = {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [
            .withYear,
            .withMonth,
            .withDay,
            .withTime
        ]
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
        
    }()
}

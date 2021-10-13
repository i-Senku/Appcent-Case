//
//  NewsListCell.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import UIKit
import Kingfisher

class NewsListCell: UITableViewCell {
    
    static let cellId = "newsListCell"
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    func populate(news : Article?){
        if let thumbnailURL = news?.urlToImage{
            DispatchQueue.main.async {
                self.articleImage.kf.setImage(with: thumbnailURL,options: [
                    .processor(DownsamplingImageProcessor(size: CGSize(width: self.articleImage.bounds.width, height: self.articleImage.bounds.height))),
                    .scaleFactor(UIScreen.main.scale),
                    .cacheOriginalImage
                ])
            }
        }
        titleText.text = news?.title
        descriptionText.text = news?.description
        releaseDate.text = news?.publishedAt
    }
}

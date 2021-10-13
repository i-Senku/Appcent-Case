//
//  DetailView.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import UIKit
import Kingfisher

final class DetailView: UIView {
    
    var viewModel : NewsDetailViewModelProtocol?
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var contentText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var authorText: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    
    override func awakeFromNib() {
        loadView()
    }
    
    func populate(){
        guard let article = viewModel?.article else { return }
        titleText.text = article.title ?? "--"
        contentText.text = article.content
        dateText.text = article.publishedAt
        authorText.text = article.author
        newsImage.kf.setImage(with: article.urlToImage)
    }
    
    
    @IBAction func showNewsSource(_ sender: Any) {
        viewModel?.showWebView()
    }
    
    private func loadView() {
        guard let contentView = loadViewFromNib(nibName: "DetailView") else { return }
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    
}

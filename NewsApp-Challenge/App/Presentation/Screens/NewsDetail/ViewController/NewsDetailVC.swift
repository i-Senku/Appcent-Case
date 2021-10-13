//
//  NewsDetailVC.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import UIKit

final class NewsDetailVC: UIViewController {
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    var viewModel : NewsDetailViewModelProtocol?
    
    @IBOutlet weak var detailView: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.delegate = self
        viewModel?.didLoad()
        detailView.viewModel = viewModel
        detailView.populate()
    }
    
    @IBAction func addToFavorite(_ sender: Any) {
        viewModel?.saveOrRemoveFavorite()
    }
    
    @IBAction func share(_ sender: Any) {
        viewModel?.share()
    }
    
    
}

extension NewsDetailVC : NewsDetailViewModelOutput {
    
    func navigate(to route: NewsDetailRoute) {
        switch route {
        case .showWebView(let url):
            show(NewsWebViewBuilder.make(url: url), sender: nil)
        case .back:
            navigationController?.popViewController(animated: true)
        }
    }
    
    func share(url: URL?) {
        guard let url = url else { return }
        let objectsToShare = [url] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func favoriteIsAvailable(isAvailable: Bool) {
        if isAvailable {
            favoriteButton.image = UIImage(systemName: "heart.fill")
        }else{
            favoriteButton.image = UIImage(systemName: "heart")
        }
    }
    
    func showAlert(title: String, message: String,onAction : @escaping ()->()) {
        showBasicAlert(title: title, message: message, style: .alert, actionTitle: "Cancel", handler: { _ in
            onAction()
        }, actionStyle: .default)
    }
    
    
}



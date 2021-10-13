//
//  FavoriteVC.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import UIKit

final class FavoriteVC: UIViewController {
    
    var viewModel : FavoriteViewModelProtocol?
    
    @IBOutlet weak var favoriteTableView: FavoriteTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTableView.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.loadFavorites()
    }
    
    @IBAction func removeAll(_ sender: Any) {
        viewModel?.clear()
    }
}

extension FavoriteVC : FavoriteViewModelOutput {
    
    func reloadTableView() {
        favoriteTableView.reloadData()
    }
    
    func basicAlert(title: String, message: String) {
        showBasicAlert(title: title, message: message, actionTitle: "Cancel")
    }
    
    func navigate(route: FavoriteViewModelRoute) {
        switch route {
        case .newsDetail(let viewModel):
            let detailVC = NewsDetailBuilder.make(viewModel: viewModel)
            show(detailVC, sender: nil)
        }
    }

}

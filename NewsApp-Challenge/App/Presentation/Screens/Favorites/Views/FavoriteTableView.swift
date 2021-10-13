//
//  FavoriteTableView.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 13.10.2021.
//

import UIKit

final class FavoriteTableView: UITableView {
    
    var viewModel : FavoriteViewModelProtocol?
    
    override func awakeFromNib() {
        registerCell(nibName: "NewsListCell", cellId: NewsListCell.cellId)
        delegate = self
        dataSource = self
    }
}

//MARK: - Data Source
extension FavoriteTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel?.favoriteList.count {
            if count == 0 {
                tableView.setEmptyView(title: "Empty", message: "Favorites not yet added")
            }else{
                tableView.restore()
            }
            return count
        }
        return viewModel?.favoriteList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListCell.cellId) as! NewsListCell
        let article = viewModel?.favoriteList[indexPath.row].toArticle()
        cell.populate(news: article)
        return cell
    }
}

//MARK: - Delegate
extension FavoriteTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectItem(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, view, swipe in
            guard let self = self else {return}
            
            self.viewModel?.deleteFavorite(index: indexPath.row)
            swipe(true)
        }
        let swipe = UISwipeActionsConfiguration(actions: [action])
        
        return swipe
    }
}

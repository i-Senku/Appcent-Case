//
//  NewsListTableView.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import UIKit

final class NewsListTableView: UITableView {
    
    var viewModel : NewsListViewModelProtocol?
    
    override func awakeFromNib() {
        registerCell(nibName: "NewsListCell", cellId: NewsListCell.cellId)
        tableFooterView = UIView()
        delegate = self
        dataSource = self
    }
}

//MARK: - Data Source
extension NewsListTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let isEmpty = viewModel?.newsList?.isEmpty {
            if isEmpty {
                tableView.setEmptyView(title: "No Result", message: "Please try again")
            }else{
                tableView.restore()
            }
        }
        return viewModel?.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListCell.cellId) as! NewsListCell
        let article = viewModel?.newsList?[indexPath.row]
        cell.populate(news: article)
        return cell
    }

}

//MARK: - TableView Delegate
extension NewsListTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelect(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

//MARK: - ScrollView Delegate
extension NewsListTableView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        if position > (contentSize.height - 150) - scrollView.frame.size.height{
            viewModel?.fetchMoreNews()
        }
    }
}



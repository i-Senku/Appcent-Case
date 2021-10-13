//
//  NewsSearchBar.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 12.10.2021.
//

import UIKit

final class NewsSearchBar: UISearchBar {
    
    var viewModel : NewsListViewModelProtocol?
    
    override func awakeFromNib() {
        delegate = self
    }
}

//MARK: - Delegate
extension NewsSearchBar : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text{
            if !searchText.isEmpty {
                viewModel?.search(text: searchText)
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel?.clearSearchData()
        }
    }
}

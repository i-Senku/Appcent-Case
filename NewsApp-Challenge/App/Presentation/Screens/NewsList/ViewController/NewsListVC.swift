//
//  NewsListVC.swift
//  NewsApp-Challenge
//
//  Created by Ercan Garip on 11.10.2021.
//

import UIKit

class NewsListVC: UIViewController {

    @IBOutlet weak var newsSearchBar: NewsSearchBar!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newsTableView: NewsListTableView!
    var viewModel : NewsListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    func start(){
        searchBar.backgroundColor = navigationController?.navigationBar.barTintColor
        newsSearchBar.viewModel = viewModel
        newsTableView.viewModel = viewModel
        viewModel?.didLoad()
    }
}

//MARK: - ViewModel Outpus
extension NewsListVC : NewsListViewModelOutput {
    
    func reloadNewsList() {
        newsTableView.reloadData()
    }
    
    func setEmptyView(title: String, message: String, isAnimate: Bool) {
        newsTableView.setEmptyView(title: title,message:message,isAnimateIndicator: isAnimate)
    }
    
    func restoreEmptyView() {
        newsTableView.restore()
    }
    
    func navigate(to route: NewsListRoute) {
        switch route {
        case .newsDetail(let vm) :
            show(NewsDetailBuilder.make(viewModel: vm), sender: nil)
        }
    }
}

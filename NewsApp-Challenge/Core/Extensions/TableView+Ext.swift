//
//  TableView+Extension.swift
//
//  Created by Ercan Garip on 28.09.2021.
//

import Foundation
import UIKit

extension UITableView{
    func registerCell(nibName : String,cellId : String,bundle : Bundle? = nil) {
        register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: cellId)
    }
    
    func setEmptyView(title: String, message: String,isAnimateIndicator : Bool = false) {
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        let indicatorView = UIActivityIndicatorView(style: .large)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(indicatorView)
        
        NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: emptyView, attribute: .centerY, multiplier: 0.8, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        indicatorView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 20).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor).isActive = true
        
        if isAnimateIndicator {
            indicatorView.startAnimating()
        }
        indicatorView.hidesWhenStopped = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center

        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

extension UITableView {
    func scrollToTop(animated: Bool) {
        setContentOffset(.zero, animated: animated)
    }
}

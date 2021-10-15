//
//  UITableViewCell+SeparatorLine.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 15/10/21.
//

import UIKit

extension UITableViewCell{
    
    open func completeSeparatorLine(_ cell: UITableViewCell){
        if (cell.responds(to: #selector(setter: UITableViewCell.separatorInset))) {
            cell.separatorInset = UIEdgeInsets.zero
        }
        
        if (cell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins))) {
            cell.preservesSuperviewLayoutMargins = false
        }
        
        if (cell.responds(to: #selector(setter: UIView.layoutMargins))) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }
}

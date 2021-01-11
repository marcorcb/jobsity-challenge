//
//  UITableView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 08/01/21.
//

import UIKit

extension UITableView {
    func reusableCell<T: UITableViewCell>(for identifier: String, for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T {
            return cell
        }

        return T()
    }
    func updateHeaderViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            header.frame.size.height = newSize.height
        }
    }
}

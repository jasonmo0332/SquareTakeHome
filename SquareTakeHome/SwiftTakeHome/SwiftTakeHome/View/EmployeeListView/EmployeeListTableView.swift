//
//  EmployeeListTableView.swift
//  SwiftTakeHome
//  The table view that is contained by the EmployeeList View. Initializes the custom TableViewCell with our EmployeeListTableViewCell. The CellReuseIdentifier is set in the constants file.
//  Created by Jason Mo on 1/20/21.
//

import Foundation
import UIKit

class EmployeeListTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        rowHeight = CGFloat(TableViewConstants.Cell.cellRowHeight)
        self.register(EmployeeListTableViewCell.self, forCellReuseIdentifier: TableViewConstants.Cell.employeeCellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

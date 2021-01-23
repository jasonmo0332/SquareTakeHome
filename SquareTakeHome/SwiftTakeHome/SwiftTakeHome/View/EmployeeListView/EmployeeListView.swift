//
//  EmployeeListView.swift
//  SwiftTakeHome
//  Created when the view controller is made, and contains the TableView
//  Created by Jason Mo on 1/19/21.
//

import Foundation
import UIKit

class EmployeeListView: UIView {
    
    let employeeListTableView = EmployeeListTableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        addSubview(employeeListTableView)
        employeeListTableView.translatesAutoresizingMaskIntoConstraints = false
        employeeListTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        employeeListTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        employeeListTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        employeeListTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

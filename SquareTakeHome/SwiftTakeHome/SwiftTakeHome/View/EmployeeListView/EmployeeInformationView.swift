//
//  EmployeeInformationView.swift
//  SwiftTakeHome
//  View that is placed in the vertical stack view, contains the imageView (an icon representing the data) and a label (which is the value of the data being displayed)
//  Created by Jason Mo on 1/20/21.
//

import Foundation
import UIKit

class EmployeeInformationView: UIView {
    
    var imageIcon: String
    var imageView = UIImageView()
    var employeeLabel = CustomLabel()
        
    init(imageIcon: String) {
        
        
        self.imageIcon = imageIcon
        
        super.init(frame: CGRect.zero)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        setupImageIcon()
        setupEmployeeLabel()
    }
    
    func setupImageIcon() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageIcon)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
    }
    
    func setupEmployeeLabel() {
        addSubview(employeeLabel)
        employeeLabel.type = .subtitle
        employeeLabel.translatesAutoresizingMaskIntoConstraints = false
        employeeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        employeeLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8.0).isActive = true
        
        employeeLabel.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

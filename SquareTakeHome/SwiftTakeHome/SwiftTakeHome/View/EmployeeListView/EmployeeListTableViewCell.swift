//
//  EmployeeListTableViewCell.swift
//  SwiftTakeHome
//  TableViewCell
//  Each cell contains an ImageView (profile Picture), the employeeNameLabel (employees name) and a VerticalStackView, which contains the EmployeeInformationView which preload icons for information to be display along.
//  Created by Jason Mo on 1/20/21.
//

import Foundation
import UIKit

class EmployeeListTableViewCell: UITableViewCell {
    let informationVerticalStackView = UIStackView()
    let smallPhotoImageView = UIImageView()
    let employeeNameLabel = CustomLabel()
    var emailInformation: EmployeeInformationView
    var phoneInformation: EmployeeInformationView
    var teamInformation: EmployeeInformationView
    var employeeTypeInformation: EmployeeInformationView
    var biographyInformation: EmployeeInformationView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        emailInformation = EmployeeInformationView(imageIcon: "email")
        phoneInformation = EmployeeInformationView(imageIcon: "call")
        teamInformation = EmployeeInformationView(imageIcon: "team")
        employeeTypeInformation = EmployeeInformationView(imageIcon: "portfolio")
        biographyInformation = EmployeeInformationView(imageIcon: "biography")
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {

        setupImageView()
        setupEmployeeNameLabel()
        setupVerticalStackView()
        setupEmployeeDetailView()
        
        
    }
    

    func setupVerticalStackView() {
        contentView.addSubview(informationVerticalStackView)
        informationVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        informationVerticalStackView.axis = .vertical
        informationVerticalStackView.distribution = .fillEqually
        informationVerticalStackView.topAnchor.constraint(equalTo: employeeNameLabel.bottomAnchor).isActive = true
        informationVerticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        informationVerticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func setupImageView() {
        contentView.addSubview(smallPhotoImageView)
        smallPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        smallPhotoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0).isActive = true
        smallPhotoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        smallPhotoImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        smallPhotoImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        smallPhotoImageView.layer.borderWidth = 5.0
        smallPhotoImageView.layer.borderColor = UIColor.lightGray.cgColor
        smallPhotoImageView.layer.masksToBounds = true
        //Image size is 250x250, so half for rounded
        smallPhotoImageView.layer.cornerRadius = 125
        smallPhotoImageView.clipsToBounds = true
        
        
    }
    
    func setupEmployeeNameLabel() {
        contentView.addSubview(employeeNameLabel)
        employeeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        employeeNameLabel.topAnchor.constraint(equalTo: smallPhotoImageView.bottomAnchor, constant: 8.0).isActive = true
        employeeNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setupEmployeeDetailView() {
        informationVerticalStackView.addArrangedSubview(emailInformation)
        informationVerticalStackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        emailInformation.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        emailInformation.translatesAutoresizingMaskIntoConstraints = false
        
        informationVerticalStackView.addArrangedSubview(phoneInformation)
        phoneInformation.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        phoneInformation.translatesAutoresizingMaskIntoConstraints = false
        
        informationVerticalStackView.addArrangedSubview(teamInformation)
        teamInformation.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        teamInformation.translatesAutoresizingMaskIntoConstraints = false
        
        informationVerticalStackView.addArrangedSubview(employeeTypeInformation)
        employeeTypeInformation.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        employeeTypeInformation.translatesAutoresizingMaskIntoConstraints = false
        
        
        informationVerticalStackView.addArrangedSubview(biographyInformation)
        biographyInformation.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        biographyInformation.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}

//
//  CustomLabel.swift
//  SwiftTakeHome
//  CustomLabel used to display user data. two enum types, title and subtitle to distinguish text
//  Created by Jason Mo on 1/20/21.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    enum LabelType {
        case title
        case subtitle
    }
    
    var type: LabelType? {
        didSet {
            switch type {
            case .title:
                textColor = .black
                font = UIFont.boldSystemFont(ofSize: 18.0)
                lineBreakMode = NSLineBreakMode.byWordWrapping
                numberOfLines = 0
            case .subtitle:
                textColor = .black
                font = UIFont.systemFont(ofSize: 14.0)
                lineBreakMode = NSLineBreakMode.byWordWrapping
                numberOfLines = 0
                
            default:
                break
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

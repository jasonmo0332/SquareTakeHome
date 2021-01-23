//
//  Employee.swift
//  SwiftTakeHome
//
//  Created by Jason Mo on 1/20/21.
//

import Foundation


/*
 Employee struct to change recieved JSON value into, optionals because not gauranteed to recieve a value for each key
 Json comes in as a dictionary, with an array of the employees
 */

struct EmployeeDictionary: Codable {
    let employees: [Employee]?
}

struct Employee: Codable {
    let uuid: String?
    let fullName: String?
    let phoneNumber: String?
    let emailAddress: String?
    let biography: String?
    let photoUrlSmall: String?
    let photoUrlLarge: String?
    let team: String?
    let employeeType: String?
}

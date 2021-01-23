//
//  EmployeeCoreData+CoreDataProperties.swift
//  SwiftTakeHome
//
//  Created by Jason Mo on 1/21/21.
//
//

import Foundation
import CoreData


extension EmployeeCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeCoreData> {
        return NSFetchRequest<EmployeeCoreData>(entityName: "EmployeeCoreData")
    }

    @NSManaged public var name: String?
    @NSManaged public var smallPhotoImage: Data?
    @NSManaged public var uuid: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var biography: String?
    @NSManaged public var largePhotoImage: Data?
    @NSManaged public var team: String?
    @NSManaged public var employeeType: String?
    @NSManaged public var emailAddress: String?

}

extension EmployeeCoreData : Identifiable {

}

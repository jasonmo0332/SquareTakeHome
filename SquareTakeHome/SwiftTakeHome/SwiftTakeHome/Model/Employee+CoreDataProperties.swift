//
//  Employee+CoreDataProperties.swift
//  SwiftTakeHome
//
//  Created by Jason Mo on 1/20/21.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var smallPhotoImage: Data?

}

extension Employee : Identifiable {

}

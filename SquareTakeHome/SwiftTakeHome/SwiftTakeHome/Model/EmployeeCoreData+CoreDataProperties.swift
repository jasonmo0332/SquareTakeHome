//
//  EmployeeCoreData+CoreDataProperties.swift
//  SwiftTakeHome
//
//  Created by Jason Mo on 1/20/21.
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

}

extension EmployeeCoreData : Identifiable {

}

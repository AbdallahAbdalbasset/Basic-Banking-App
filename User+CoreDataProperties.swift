//
//  User+CoreDataProperties.swift
//  Basic Banking App
//
//  Created by Macbook on 10/6/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var balance: Float
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension User : Identifiable {

}

//
//  TransferHistory+CoreDataProperties.swift
//  Basic Banking App
//
//  Created by Macbook on 10/6/22.
//
//

import Foundation
import CoreData


extension TransferHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransferHistory> {
        return NSFetchRequest<TransferHistory>(entityName: "TransferHistory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var senderId: UUID?
    @NSManaged public var recieverId: UUID?
    @NSManaged public var amount: Float

}

extension TransferHistory : Identifiable {

}

//
//  File.swift
//  Basic Banking App
//
//  Created by Macbook on 10/4/22.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BankingApp")
    
    init() {
        container.loadPersistentStores{ _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}

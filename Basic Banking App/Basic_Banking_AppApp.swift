//
//  Basic_Banking_AppApp.swift
//  Basic Banking App
//
//  Created by Macbook on 10/4/22.
//

import SwiftUI

@main
struct Basic_Banking_AppApp: App {
    @StateObject var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

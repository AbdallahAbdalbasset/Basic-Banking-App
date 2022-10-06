//
//  ContentView.swift
//  Basic Banking App
//
//  Created by Macbook on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users : FetchedResults<User>
    @FetchRequest(sortDescriptors: []) var transferHistory: FetchedResults<TransferHistory>
    @Environment(\.managedObjectContext) var moc
    @State var name = ""
    @State var email = ""
    @State var balance:Float = 0.0
    @State private var showHistorySheet = false
    var body: some View {
        NavigationView {
            VStack {
                List(users, id: \.id) { user in
                    NavigationLink {
                        UserDetails(user: user)
                    } label: {
                        UserRow(user: user)
                    }
                    
                }
                
            }
            .toolbar{
                ToolbarItemGroup {
                    Button("History") {
                        showHistorySheet = true
                    }
                }
            }
            .sheet(isPresented: $showHistorySheet) {
                HistorySheet(users: users, history: transferHistory)
            }
            .navigationTitle("Bsic Banking App")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

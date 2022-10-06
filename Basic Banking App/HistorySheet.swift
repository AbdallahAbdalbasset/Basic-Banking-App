//
//  HistorySheet.swift
//  Basic Banking App
//
//  Created by Macbook on 10/6/22.
//

import SwiftUI

struct HistorySheet: View {
    let users : FetchedResults<User>
    let history : FetchedResults<TransferHistory>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(history, id: \.id) { record in
                    HistoryRow(sender: nameOfUser(user: record.senderId ?? UUID()), reciever: nameOfUser(user: record.recieverId ?? UUID()), amount: record.amount)
                }
                
                
            }
            .navigationTitle("Transfer History")
        }
    }
    
    func nameOfUser( user: UUID) -> String {
        return users.first { element in
            element.id == user
        }?.name ?? "Unknown name"
    }
    
    
}


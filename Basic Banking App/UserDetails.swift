//
//  UserDetails.swift
//  Basic Banking App
//
//  Created by Macbook on 10/4/22.
//

import SwiftUI

struct UserDetails: View {
    @State private var showSheet = false
    let user: User
    var body: some View {
        VStack {

            Form {
                Section ("Name") {
                    Text(user.name ?? "Unknown Name")
                }
                Section ("E-mail") {
                    Text(user.email ?? "Unknown Email")
                }
                Section ("Balance") {
                    Text(user.balance, format: .currency(code: "USD"))
                        .foregroundColor(.green.opacity(0.8))
                    
                    HStack {
                        Spacer()
                        Button {
                            showSheet = true
                        } label: {
                            Label("Send Money", systemImage: "dollarsign.circle.fill")
                                .foregroundColor(.green.opacity(0.8))
                        }
                        Spacer()
                    }
                }
                
                
            }
            .sheet(isPresented: $showSheet) {
                MoneyTransferSheet(sender: user)
            }
            
            
            
        }
    }
}


//
//  UserRow.swift
//  Basic Banking App
//
//  Created by Macbook on 10/4/22.
//

import SwiftUI

struct UserRow: View {
    let user: User
    var body: some View {
        HStack {
            Image(systemName: "\(((user.name ?? "Abdallah").first ?? "a" ).lowercased()).circle")
                .font(.title)
            
            VStack (alignment: .leading) {
                Text(user.name ?? "Unknown Name")
                    .font(.title)
                Text(user.balance, format: .currency(code: "USD"))
                    .foregroundColor(.green.opacity(0.8))
                
            }
            Spacer()
        }
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .stroke(lineWidth: 1)
                .fill(.blue.opacity(0.3))
        }
    }
}


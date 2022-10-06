//
//  HistoryRow.swift
//  Basic Banking App
//
//  Created by Macbook on 10/6/22.
//

import SwiftUI

struct HistoryRow: View {
    
    let sender : String
    let reciever : String
    let amount : Float
    
    var body: some View {
        HStack {
            Text(sender)
            Spacer()
            Text(reciever)
            Spacer()
            Text(amount, format: .currency(code: "USD"))
                .foregroundColor(.green.opacity(0.8))
        }
    }
}


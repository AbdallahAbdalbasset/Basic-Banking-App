//
//  MoneyTransferSheet.swift
//  Basic Banking App
//
//  Created by Macbook on 10/4/22.
//

import SwiftUI

struct MoneyTransferSheet: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users : FetchedResults<User>
    @FetchRequest(sortDescriptors: []) var transferHistory: FetchedResults<TransferHistory>
    @Environment(\.managedObjectContext) var moc
    @State private var reciever:User = User()
    @State private var amount: Float = 0.0
    @State private var ShowAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @FocusState private var isfoused: Bool
    var sender: User



    var body: some View {
        NavigationView {
            Form {
                Section ("Send from") {
                   UserRow(user: sender)
                }
                
                Section ("Reciever") {
                    Picker("Select", selection: $reciever) {
                        ForEach(users, id: \.self) { user in
                                if user.id != sender.id {
                                    UserRow(user: user)
                                }
                            }
                    }
                }
                
                Section("Amount") {
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isfoused)
                    
                    Button{
                        if users.contains(reciever) {
                            sendMoney()

                        }
                    } label: {
                        Label("Send", systemImage: "paperplane.circle.fill")
                            .foregroundColor(.green.opacity(0.8))
                    }
                }
            }
            .toolbar{
                ToolbarItemGroup (placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isfoused = false
                    }
                }
            }
            .alert(alertTitle, isPresented: $ShowAlert) {
                Button("Ok") { try? moc.save()  }
            }message: {
                Text(alertMessage)
            }
            .navigationTitle("Transfer Money")
        }
    }
    
    func sendMoney() {
        
        if users.count > 1 && users.contains(where: { user in
            user.id == reciever.id
        }) && sender.id != reciever.id && amount > 0 && users.first(where: { user in
            sender.id == user.id
        })!.balance >= amount {
            
            users.first { user in
                sender.id == user.id
            }?.balance -= amount
            
            users.first { user in
                reciever.id == user.id
            }?.balance += amount
            
            let tempSender =  users.first { user in
                sender.id == user.id
            } ?? User(context: moc)
            
            let tempReciever = users.first { user in
                reciever.id == user.id
            } ?? User(context: moc)

            moc.delete(tempSender)
            moc.delete(tempReciever)
            
            let newSender = User(context: moc)
            newSender.id = tempSender.id
            newSender.name = tempSender.name
            newSender.email = tempSender.email
            newSender.balance = tempSender.balance
            
            let newReciever = User(context: moc)
            newReciever.id = tempReciever.id
            newReciever.name = tempReciever.name
            newReciever.email = tempReciever.email
            newReciever.balance = tempReciever.balance
            
            let histortRecord = TransferHistory(context: moc)
            histortRecord.id = UUID()
            histortRecord.senderId = newSender.id
            histortRecord.recieverId = newReciever.id
            histortRecord.amount = amount
            
            prepareAlert(title: "Successfully", message: "Amound: \(amount) sent.")
            amount = 0
            ShowAlert = true
            
        }
        else {
            prepareAlert(title: "Failed", message: "Error Ocuurs")
            ShowAlert = true
        }
    }
    
    func prepareAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
    }
}


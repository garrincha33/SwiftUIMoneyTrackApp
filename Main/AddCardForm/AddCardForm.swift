//
//  AddCardForm.swift
//  SwiftUIMoneyTracker
//
//  Created by Richard Price on 28/10/2021.
//

import SwiftUI
struct AddCardForm: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var cardNumber = ""
    @State private var limit = ""
    @State private var cardType = "Visa"
    @State private var month = 1
    @State private var year = Calendar.current.component(.year, from: Date())
    @State private var color = Color.blue
    let currentYear = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        NavigationView {
            Form {
               
                Section(header: Text("Card Info"))  {
                    TextField("Name", text: $name)
                    TextField("Credit Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)
                    TextField("Credit Limit", text: $limit)
                        .keyboardType(.numberPad)
          
                    Picker("Type", selection: $cardType) {
                        ForEach(["Visa", "MasterCard", "Revolut"], id: \.self) {
                            cardType in
                            Text(String(cardType)).tag(String(cardType))
                        }
                    }
                    //another way of doing it
//                    Picker("Type", selection: $cardType) {
//                        Text("Visa").tag("Visa")
//                        Text("MasterCard").tag("MasterCard")
//                        Text("Revlout").tag("Revlout")
//                    }
                }
            
                Section(header: Text("Expiration"))  {
                    Picker("Month", selection: $month) {
                        ForEach(1..<13, id: \.self) {
                            num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    
                    Picker("Year", selection: $year) {
                        ForEach(currentYear..<currentYear + 20, id: \.self) {
                            num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                }
                
                Section(header: Text("Color"))  {
                    ColorPicker("Color", selection: $color)
                }
            }
                .navigationTitle("Add Credit Card")
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                }))
        }
    }
}

struct AddCardForm_Previews: PreviewProvider {
    static var previews: some View {
        AddCardForm()
    }
}


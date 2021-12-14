//
//  AddCardForm.swift
//  SwiftUIMoneyTracker
//
//  Created by Richard Price on 28/10/2021.
//

import SwiftUI
struct AddCardForm: View {
    
    @Environment(\.presentationMode) var presentationMode
    //step 3 add more state storage
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
                    //step 2 add sections to card form
                Section(header: Text("Card Info"))  {
                    TextField("Name", text: $name)
                    TextField("Credit Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)
                    TextField("Credit Limit", text: $limit)
                        .keyboardType(.numberPad)
                    
                    //step 3 add a type with a picker
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
                //step 4 add a expiration with a picker for month and year
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


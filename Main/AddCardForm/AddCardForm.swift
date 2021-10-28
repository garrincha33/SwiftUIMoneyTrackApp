//
//  AddCardForm.swift
//  SwiftUIMoneyTracker
//
//  Created by Richard Price on 28/10/2021.
//

import SwiftUI
//step 4 create a new AddCardForm View
struct AddCardForm: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Text("Add card form")
                
                TextField("Name", text: $name)
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
//        AddCardForm()
        MainView()
    }
}


//
//  MainView.swift
//  SwiftUIMoneyTracker
//
//  Created by Richard Price on 24/10/2021.
//

import SwiftUI

struct MainView: View {
    
    //step 5 add core data fetch request code
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Card.timestamp, ascending: true)],
        animation: .default)
    private var cards: FetchedResults<Card>
    
    @State private var shouldPresentAddCardForm = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                //step 6 wrap inside a not empty check to prevent a crash
                if !cards.isEmpty {
                    TabView {
                        //step 6 pull from card core data
                        ForEach(cards) { card in
                            CreditCardView()
                                .padding(.bottom, 50)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 280)
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                Spacer()
                    .fullScreenCover(isPresented: $shouldPresentAddCardForm, onDismiss: nil) {
                        AddCardForm()
                    }
            }
            .navigationTitle("Credit Cards")
            //step 2 add item button to leading
            //step 3 - add components to CoreData
            //step 8 add a hstack for mulitple buttons
            .navigationBarItems(leading: HStack {
                addItemButton
                deleteAllButton
            } ,
            trailing: addCardButton)
        }
    }
    //step 1 add item button to nav with a new view
    var addItemButton: some View {
        Button(action: {
            
            //step 4 create core data objects, view context is used for the storage
            withAnimation {
                let viewContext = PersistenceController.shared.container.viewContext
                let card = Card(context: viewContext)
                card.timestamp = Date()
                
                do {
                    try viewContext.save()
                } catch {
                    
                }
            }
            
        }, label: {
            Text("Add Item")})
    }
    
    //step 7 delete all objects button
    var deleteAllButton: some View {
        Button(action: {
            withAnimation {
                cards.forEach { card in
                    viewContext.delete(card)
                }
                do {
                    try viewContext.save()
                } catch {
                    
                }
            }
            
        }, label: {
            Text("Delete All")})
    }
    

    struct CreditCardView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("Apple Blue Visa Card")
                    .font(.system(size: 24, weight: .semibold))
                
                HStack {
                    Image("Card2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 44)
                        .clipped()
                    Spacer()
                    Text("Balance: $5,000")
                        .font(.system(size: 18, weight: .semibold))
                }
                
                
                Text("1234 1234 1234 1234")
                
                Text("Credit Limit: $50,000")
                
                HStack { Spacer() }
            }
            .foregroundColor(.white)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .center, endPoint: .bottom)
            )
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
            .cornerRadius(8)
            .shadow(radius: 5)
            .padding(.horizontal)
            .padding(.top, 8)
        }
    }

    var addCardButton: some View {
        Button(action: {
            shouldPresentAddCardForm.toggle()
        }, label: {
            Text("+ Card")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .background(Color.black)
                .cornerRadius(5)
        })
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        MainView()
            //        AddCardForm()
            .environment(\.managedObjectContext, viewContext)
    }
}

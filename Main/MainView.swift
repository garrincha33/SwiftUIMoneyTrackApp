//
//  MainView.swift
//  SwiftUIMoneyTracker
//
//  Created by Richard Price on 24/10/2021.
//

import SwiftUI

struct MainView: View {
    //step 1 create a state variable This is a new Swift feature called a "property wrapper”. It’s a mechanism that allows you to wrap a type in another type that provides some functionality, while still exposing the underlying wrapped value to us directly
    @State private var shouldPresentAddCardForm = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                TabView {
                    ForEach(0..<5) { num in
                        CreditCardView()
                            .padding(.bottom, 50)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 280)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                //step 2 create a full screen cover
                Spacer()
                    .fullScreenCover(isPresented: $shouldPresentAddCardForm, onDismiss: nil) {
                        AddCardForm()
                    }
            }
            .navigationTitle("Credit Cards")
            .navigationBarItems(trailing: addCardButton)
        }
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
            // step 3 trigger action
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
        MainView()
        //        AddCardForm()
    }
}

//
//  MainView.swift
//  SwiftUIMoneyTracker
//
//  Created by Richard Price on 24/10/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        //step 1 create a navigation view and scrollview
        NavigationView {
            ScrollView {
                //step 8 create a tab view
                TabView {
                    ForEach(0..<5) { num in
                        CreditCardView()
                            .padding(.bottom, 50)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 280)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                
            }
            .navigationTitle("Your Cards")
            .navigationBarItems(trailing: addCardButton)
        }
    }
}

//step 7 refactor view
struct CreditCardView: View {
    var body: some View {
        //step 3 create card view with a Vstack / Hstack
        VStack(alignment: .leading, spacing: 16) {
            Text("Apple Blue Visa Card")
                .font(.system(size: 24, weight: .semibold))
            //step 4 - add card assets
            HStack {
                Image("Card2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 44)
                    .clipped()
                Spacer()
                Text("Balance: £5000")
            }
           
            Text("1234 1234 1234 1234")
            Text("Credit Limit: £10,000")
            
            //step 3
            HStack { Spacer() }
        }
        .foregroundColor(Color.white)
        .padding()
        //step 5 repplace background blue with a grandient
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .center, endPoint: .bottom)
        )
        //step 6 apply a stroke around the card (border effect)
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1))
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

//step 2 create a new buttonView
var addCardButton: some View {
    Button(action: {
    }, label: {
        Text("+ Card")
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .bold))
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(Color.black)
            .cornerRadius(5)
    })
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  MainFeedPage.swift
//  TerpExchange
//
//  Created by Eric Chu on 3/19/21.
//

import Foundation
import SwiftUI
/*
 This is going to create the feed that shows the books in
 the main page.
 */
struct MainFeedPage: View {

    var body: some View {
        ScrollView {
            
            CardView(image: "intro_to_lin", price: "$34", title: "Intro to Linear Algebra", user: "Alex Chu", className: "MATH240")
            CardView(image: "intro_to_algos", price: "$56", title: "Intro to Algorithms", user: "Hank Quinto", className: "CMSC351")
            CardView(image: "intro_to_ds_and_algos", price: "$45", title: "Intro to Data Struct. & Algorithms", user: "Eric Wu", className: "CMSC132")

        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


struct ContentView_Previews3 : PreviewProvider {
    static var previews: some View {
        MainFeedPage().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

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
    
    @Binding var booksUIImage: [UIImage?]
    @Binding var booksInfo: [String:[String]]
    @State var info: [[String]] = [["$34", "Intro to Linear Algebra", "ADMIN", "class101", "math"],
                                 ["$40", "Intro to Statistic", "ADMIN", "class101", "math"],
                                 ["$20", "Intro to Computer Science", "ADMIN", "class101", "cs"],
                                 ["$80", "Intro to IOS Programming", "ADMIN", "class101", "cs"],
                                 ["$55", "Advance Calculus 2", "ADMIN", "class101", "math"],
                                 ["$10", "Calculus 1", "ADMIN", "class101", "math"],
                                 ["$39", "Statistic 2", "ADMIN", "class101", "math"],
                                 ["$60", "Analysis of Genes and Genomes", "ADMIN", "class101", "musc"],
                                 ["$30", "Intro to Old Norse","ADMIN", "class101", "musc"],
                                 ["$20", "Essentials of Programming Languages", "ADMIN", "class101", "cs"],
                                 ["$100", "How to Design Programs","ADMIN", "class101", "cs"],
                                 ["$30", "Lisp in Small Pieces", "ADMIN", "class101", "other"],
                                 ["$70", "The Science of Life", "ADMIN", "class101", "science"],
                                 ["$20", "Treatise on Instrumentation", "ADMIN", "class101", "musc"],
                                 ["$40", "Wheelock's Latin", "ADMIN", "class101", "other"],
                                 ["$20", "Programming in Haskell", "ADMIN", "class101", "cs"],
                                 ["$25", "Real World Haskell", "ADMIN", "class101", "other"],
                                 ["$70", "Manuale di scrittura musicale", "ADMIN", "class101", "other"],
                                 ["$75", "Theory of Harmony", "ADMIN", "class101", "musc"],
                                 ["$20", "The New Media Reader", "ADMIN", "class101", "other"],
                                 ["$50", "Expressive Processing", "ADMIN", "class101", "other"],
                                 ["$45", "Waterfalls", "ADMIN", "class101", "other"],
                                 ["$20", "Don't Speak", "ADMIN", "class101", "other"],
                                 ["$25", "Disbuted revision control with Mercurial", "ADMIN", "class101", "other"], ["$25", "Disbuted revision control with Mercurial", "ADMIN", "class101", "other"]]
                                 

    var body: some View {
        ScrollView {
            

//            CardView(image: "intro_to_lin", price: "$34", title: "Intro to Linear Algebra", user: "Alex Chu", className: "MATH240", tag1: "MATH", tag2: "Introductory Class")
//            CardView(image: "intro_to_algos", price: "$56", title: "Intro to Algorithms", user: "Hank Quinto", className: "CMSC351", tag1: "CMSC", tag2: "Junior level")
//            CardView(image: "intro_to_ds_and_algos", price: "$45", title: "Intro to Data Struct. & Algorithms", user: "Eric Wu", className: "CMSC132", tag1: "CMSC", tag2: "Sophomore level")
//            CardView(image: "mirror", price: "$30", title: "Living Room Mirror", user: "Steve Rogers", className: "Other", tag1: "Dorm", tag2: "Accessories")
            
          
            ForEach (0..<booksUIImage.count, id: \.self ) { i in
                
                CardView(image: booksUIImage[i]!, price: info[i][0], title: info[i][1], user: info[i][2], className: info[i][3], tag1: info[i][4])
                
            }
  

        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
        
    }
    
    
    
    
}

//
//struct ContentView_Previews3 : PreviewProvider {
//    static var previews: some View {
//        MainFeedPage(booksUIImage: .constant([])).previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//    }
//}

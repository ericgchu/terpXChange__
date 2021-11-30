//
//  CardView.swift
//  TerpExchange
//
//  Created by Alexander Quinto on 3/19/21.
//

import Foundation
import SwiftUI

/*
 This creates the individual cards that will be shown in the main feed
 displays picture of textbook, along with price, title, class associated, and the user
 who posted it
 */
struct CardView: View {
    var image: String
    var price: String
    var title: String
    var user: String
    var className: String
   var body: some View {
    
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Text(className)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        Text(price)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                    }
                    
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    HStack(spacing: 1) {
                        Text(user.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer().frame(width: 50, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("STEM").font(.system(size: 14))  .foregroundColor(Color.blue).padding(.vertical,10).padding(.horizontal).background(Capsule().stroke(Color.blue, lineWidth: 1))
                        Spacer().frame(width: 50, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("C.S.").font(.system(size: 14))  .foregroundColor(Color.blue).padding(.vertical,10).padding(.horizontal).background(Capsule().stroke(Color.blue, lineWidth: 1))
                    }
                    
                }.layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255,
                              opacity: 0.1),lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

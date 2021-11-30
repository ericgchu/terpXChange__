//
//  ProfileView.swift
//  TerpExchange
//
//  Created by Alexander Quinto on 4/2/21.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var price: String
    var title: String
    var user: String
    var className: String
   var body: some View {
    
        VStack {
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
                    Text(user.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
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


struct ContentView_Previews7 : PreviewProvider {
    static var previews: some View {
        ProfileView(price: "5", title: "newbook", user: "hank", className: "class101").previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

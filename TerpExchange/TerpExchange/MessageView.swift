//
//  MessageView.swift
//  TerpExchange
//
//  Created by Eric Chu on 4/16/21.
//
 
import Foundation
import SwiftUI
 
struct MessageView: View {
    
    var profilePicture: String
    var person: String
    var headlining: String
 
    var body: some View {
        
            HStack {
                Image(profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding()
                    .frame(width: 100, height: 120)
                
                
                VStack(alignment: .leading) {
                    Text(person)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                        
                        Spacer()
                        Text(headlining)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                    
 
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

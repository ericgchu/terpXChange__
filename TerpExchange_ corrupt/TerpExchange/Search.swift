//
//  Search.swift
//  TerpExchange
//
//  Created by Alexander Quinto on 4/16/21.
//

import Foundation
import SwiftUI

struct Search: View {
    @Binding var show: Bool
    @State var searchString = ""
    var body: some View {
        VStack {
            Group {
                HStack {
                    Button(action: {self.show.toggle()}){
                        Text("Cancel")
                            .padding()
                    }
                    Spacer()
                    Button(action: {/* hank would have to write this since this would upload to DB*/
                        
                        self.show.toggle()
                        
                    }) {
                        Text("Search")
                            .padding()
                    }
                }
                .foregroundColor(.red)
                .clipShape(Capsule())
            
            }
            
            TextField("Search", text: $searchString)
                .padding()
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(10.0)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
            Divider().frame(width: 360)
            Spacer()
            
            
            //hank would display the results below
            

        }
    }
}

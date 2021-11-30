//
//  MessagePage.swift
//  TerpExchange
//
//  Created by Hank Wu on 4/4/21.
//

import Foundation
import SwiftUI

struct MessagePage : View {
    
    var body: some View {
        

        ScrollView {
            MessageView(profilePicture: "ron", person: "Eric Quinto", headlining: "Hey, is 351 txtbook still available? Ready to Pay")
            Divider().background(Color.black).frame(width: 320, alignment: .center)
            MessageView(profilePicture: "ron", person: "Eric Quinto", headlining: "Hey, is 351 txtbook still available? Ready to Pay")
            Divider().background(Color.black).frame(width: 320, alignment: .center)
            MessageView(profilePicture: "ron", person: "Eric Quinto", headlining: "Hey, is 351 txtbook still available? Ready to Pay")
            Divider().background(Color.black).frame(width: 320, alignment: .center)
            MessageView(profilePicture: "ron", person: "Eric Quinto", headlining: "Hey, is 351 txtbook still available? Ready to Pay")
            Divider().background(Color.black).frame(width: 320, alignment: .center)
            MessageView(profilePicture: "ron", person: "Eric Quinto", headlining: "Hey, is 351 txtbook still available? Ready to Pay")

        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

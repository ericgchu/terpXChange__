//
//  ProfilePage.swift
//  TerpExchange
//
//  Created by Eric Chu on 3/19/21.
//

import Foundation
import SwiftUI


struct ProfilePage: View {

    @Environment(\.presentationMode) var presentationMode
    
    //var name = ""
    //var profilePicture: UIImage?
    var body: some View {
                
        VStack {
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Sign Out")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing:300))
            }
            
            
            Group {
                //will add ability to change profile picture later on
                HStack(spacing: 0) {
                    Image("spongebob")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding()
                        .frame(width: 180, height: 150)
                    Text("Adminstrator")
                        .padding()
                        .font(.headline)
                }
                .clipShape(Capsule())
            }
            VStack(alignment: .trailing) {
                HStack(spacing: 2) {
                    HStack(spacing: 15) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                        Image(systemName: "camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                        Image(systemName: "pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    }
                }
            }
         
            Text("Posts")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                .font(.system(size: 25))
            
            Divider()
            Spacer()
            ScrollView {
                ForEach(1...6, id: \.self) { _ in
                    ProfileView(price: "$10", title: "Survival Guide 351", user: "Admin", className: "CMSC351")
                }
            }
            Spacer()
        }
        .navigationBarHidden(true)
            
    }
}

struct ContentView_Previews4 : PreviewProvider {
    static var previews: some View {
        ProfilePage().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

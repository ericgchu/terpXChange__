//
//  File.swift
//  TerpExchange
//
//  Created by Eric Chu on 3/19/21.
//

import Foundation
import SwiftUI
import FirebaseAuth



// Login Page Struct
struct LoginPage: View {
    @State var showSignUp: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    @State var errLabel: String = ""
    @State var hidden: Bool = true
    @State var isActive : Bool = false
    
    @State var tappedSignup = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Spacer(minLength: 0)
                
                VStack {
                
                    HStack {
                        Text("TerpXChange").font(.system(size: 40, weight: .bold, design: .default)).bold().italic().foregroundColor(Color.black).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                        Image("origami").resizable().aspectRatio(contentMode: .fill).frame(width:60, height: 60)
                    }
                    
                    // Username
                    HStack {
                        TextField("Username", text: $username).padding().background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).cornerRadius(10.0).padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                    }
                    
                    Divider().frame(width: 350)
                    
                    // Password
                    HStack {
                        
                        if !hidden {
                        
                            TextField("Password", text: $password)
                                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .cornerRadius(10.0)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                                .padding()
                                
                        } else {
                            
                            SecureField("Password", text: $password)
                                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .cornerRadius(10.0)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                                .padding()
                            
                        }
                        
                        Button (action: {hidden.toggle()}) {
                            Image (systemName: self.hidden ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor((self.hidden) ? Color.secondary : Color.blue)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30 ))
                    }
                    
                    Divider().frame(width: 350)
                
                }

                // Sign up linking hyperlink
               /* Text("Sign Up").font(.system(size: 15, design: .serif)).underline().foregroundColor(Color.white).padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 290)) */
                
                if errLabel != "" {
                    Text(errLabel).foregroundColor(.red).padding(EdgeInsets (top: 10, leading: 10, bottom: 0, trailing: 10))
                }

                NavigationLink(destination: MainMenu(), isActive: self.$isActive){
                    Text("")
                }
                
                Button(action: {login(username: username, passwd: password)}){
                    Text("Sign In")
                        .frame(width: 250, height: 50, alignment: .center)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke().fill(Color.black))
                        .foregroundColor(Color.black)
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                HStack {
                    
                    Text("New to TerpXChange? ").font(.system(size:15))
                    
//                    NavigationLink (destination: SignUpPage()) {
//                        Text("Sign Up")
//                            .font(.caption)
//                    }
                    
                    Button (action: {showSignUp.toggle()}, label: {
                        Text("Sign Up")
                    }).sheet(isPresented: $showSignUp){
                        SignUpPage(showThisPage: $showSignUp)
                    }
                    
                }.padding(.vertical)
                
            }
            
        }
    }

    
    func login (username: String, passwd: String) {
        
        let trimUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimpasswd = passwd.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: trimUsername, password: trimpasswd) { (result, err) in
            
            if err != nil {
                errLabel = err!.localizedDescription
            } else {
                isActive = true
            }
            
        }
        
    }

}



struct ContentView_Previews1 : PreviewProvider {
    static var previews: some View {
        LoginPage().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}


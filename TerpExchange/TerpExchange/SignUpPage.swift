//
//  File.swift
//  TerpExchange
//
//  Created by Eric Chu on 3/19/21.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

// Sign Up Page Struct
struct SignUpPage: View {
    @Binding var showThisPage: Bool
    @State var new_username: String = ""
    @State var new_password: String = ""
    @State var statusLabel: String = ""
    @State var errFlag: Bool = false
    @State var successFlag: Bool = false
    @State var hidden : Bool = true

    var body: some View {
        
        VStack {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Create an Account").font(.system(size: 40, weight: .bold, design: .default)).bold().italic().foregroundColor(Color.black).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            
            // Username
            HStack {
                TextField("Username", text: $new_username).padding().background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).cornerRadius(10.0).padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))
            }
            Divider().frame(width: 350)
            
            // Password
            HStack {

                
                if !hidden {
                
                    TextField("Password", text: $new_password)
                        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .cornerRadius(10.0)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))
                        .padding()
                        
                } else {
                    
                    SecureField("Password", text: $new_password)
                        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .cornerRadius(10.0)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))
                        .padding()
                    
                }
                
                Button (action: {hidden.toggle()}) {
                    Image (systemName: self.hidden ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor((self.hidden) ? Color.secondary : Color.blue)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30 ))
                
                
//                TextField("Password", text: $new_password).padding().background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).cornerRadius(10.0).padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                
                
            }
            
            Divider().frame(width: 350).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            // Sign up linking hyperlink
//            Text("Sign Up").font(.system(size: 15, design: .serif)).underline().foregroundColor(Color.green).padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 290))
            
            
            if errFlag {
                Text (statusLabel)
                    .foregroundColor(.red)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            } else if successFlag {
                Text (statusLabel)
                    .foregroundColor(.green)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            
            
            Button(action: {createUser(email: new_username, passwd: new_password)}){
                Text("Create Account")
                    .frame(width: 250, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke().fill(Color.black))
                    .foregroundColor(Color.black)
            }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
    }
    
    
    
    
    func createUser (email : String, passwd : String) {
        
        let trimEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimPasswd = passwd.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: trimEmail, password: trimPasswd) { (result, err) in
            
            if err != nil {
                
                errFlag = true
                successFlag = false
                statusLabel = err!.localizedDescription
                
            } else {
                
                errFlag = false
                successFlag = true
                statusLabel = "Your account successfully created\n Redirecting to Login Page..."
                
                let uid = Auth.auth().currentUser?.uid
                
                Firestore.firestore().collection("users").document(uid!).setData(["email" : trimEmail])
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    showThisPage.toggle()
                }
            }
            
        }
                
    }
    
}




struct ContentView_Previews2 : PreviewProvider {
    @State static var value = false
    static var previews: some View {
        SignUpPage(showThisPage: $value).previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

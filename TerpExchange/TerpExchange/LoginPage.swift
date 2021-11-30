//
//  File.swift
//  TerpExchange
//
//  Created by Eric Chu on 3/19/21.
//

import Foundation
import SwiftUI
import Firebase

// Login Page Struct
struct LoginPage: View {
    @State var uidArr: [String] = []
    @State var booksInfo: [String:[String]] = [:]
    @State var booksImage: [String] = []
    @State var booksUIImage: [UIImage?] = []
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
                                .padding()
                                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .cornerRadius(10.0)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
//                                .padding()
                                
                        } else {

                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .cornerRadius(10.0)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
//                                .padding()

                        }
                        
                        Button (action: {hidden.toggle()}) {
                            Image (systemName: self.hidden ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor((self.hidden) ? Color.secondary : Color.blue)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30 ))
                    }
                    
                }
                
                Divider().frame(width: 350)

                                
                                
                                
                // Sign up linking hyperlink
               /* Text("Sign Up").font(.system(size: 15, design: .serif)).underline().foregroundColor(Color.white).padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 290)) */
                
                if errLabel != "" {
                    Text(errLabel).foregroundColor(.red).padding(EdgeInsets (top: 10, leading: 10, bottom: 0, trailing: 10))
                }

                NavigationLink(destination: MainMenu(booksInfo: $booksInfo, booksImage: $booksImage, booksUIImage: $booksUIImage), isActive: self.$isActive){
                    Text("")
                }
                
                Button(action: {
                    login(username: username, passwd: password)
                    
                    retriImage()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if errLabel == "" {
                            retriveBookInfo()
                        }
                        
                    }
                    

                    
                }){
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
        booksInfo = [String : [String]]()
        let trimUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimpasswd = passwd.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: trimUsername, password: trimpasswd) { (result, err) in
            
            if err != nil {
                errLabel = err!.localizedDescription
            } else {
                isActive = true
                
                errLabel = ""
                self.username = ""
                password = ""
                
            }
            
        }
                
    }
    
    
    func retriveBookInfo () {
        let uid = Auth.auth().currentUser?.uid
        Firestore.firestore().collection("users").document(uid!).collection("Book Post").addSnapshotListener {(snap, err) in
            if err != nil {
                print("error retriving data in ProfilePage")
            } else {

                for i in snap!.documentChanges {

                    let booktitle = i.document.documentID
                    let cstr = i.document.get("class") as! String
                    let pstr = i.document.get("price") as! String
                    let tstr = i.document.get("title") as! String
                    let catstr = i.document.get("category") as! String

                    let infoArr = [cstr, pstr, tstr, catstr]

                    booksInfo[String(booktitle)] = infoArr

                }

            }

        }

        retriImage()

    }
    
    func retriImage () {
//        uidArr = []
        booksImage = []
        booksUIImage = []
        let storageRef = Storage.storage().reference()
        
        storageRef.listAll { (result, err) in
            
            if err != nil {
                print("Error getting all data from storage -- \(String(describing: err?.localizedDescription))")
            }
            
            for prefix in result.prefixes {
                
                prefix.listAll { (res_books, err_books) in
                    if err != nil {
                        print("error again")
                    } else {
                        for items in res_books.prefixes {
                            booksImage.append(items.child("pic0").fullPath)
                        }
                    }
                }
                
                
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

            print(booksImage.count)
            
            
            for path in booksImage {

                storageRef.child(path).getData(maxSize: 10 * 1024 * 1024) { (imageData, err) in

                    if let err = err {
                        print("error getting photo - \(String(describing: err.localizedDescription))")
                        booksUIImage.append(nil)
                    } else {
                        
                        if let imageData = imageData {
                            self.booksUIImage.append(UIImage (data: imageData))

                        } else {
                            print("cannot unwrap")
                        }
                        

//                        if imageData != nil {
//
//                        } else {
//                            print("Not able to unwrap image data in imageData")
//                        }


                    }

                }

            }
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {

            print(booksImage)
            print(booksUIImage)
            print("count for UI data - \(booksUIImage.count)")
            
        }

        
        
        
        
    }
    
    

}



//struct ContentView_Previews1 : PreviewProvider {
//    static var previews: some View {
//        LoginPage().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//    }
//}


//
//  ProfilePage.swift
//  TerpExchange
//
//  Created by Eric Chu on 3/19/21.
//

import Foundation
import SwiftUI
import Firebase


struct ProfilePage: View {

    @Environment(\.presentationMode) var presentationMode
    @Binding var booksInfo: [String:[String]]
    @State var image: UIImage?
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var name = ""
    @State var showChangeName = false
    @State var showIGChange = false
    @State var IGName = ""
    @State var name1 = "Change name"
    @State var name2 = "Change IG Name"
    //var name = ""
    //var profilePicture: UIImage?
    var body: some View {
                
        ZStack {
            VStack {
                
                Button(action: {
                    do {
                        try Auth.auth().signOut()
                    } catch let signOutError as NSError {
                        print("Error Signing out %@", signOutError)
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Sign Out")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing:300))
                }
                
                
                Group {
                    //will add ability to change profile picture later on
                    HStack(spacing: 0) {
                        if image == nil {
                            Image("spongebob")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding()
                                .frame(width: 180, height: 150)
                        } else {
                            Image(uiImage: image!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding()
                                .frame(width: 180, height: 150)
                        }
                        VStack {
                            if name.isEmpty {
                                Text("Adminstrator")
                                    .padding()
                                    .font(.headline)
                            } else {
                                Text(name)
                                    .padding()
                                    .font(.headline)
                            }
                            
                            
                            HStack(spacing: 2) {
                                HStack(spacing: 15) {
                                    

                                    
                                    
                                   
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    
                                
                               
                                    Button(action: {
                                        showActionSheet = true
                                    }) {
                                        Image(systemName: "camera")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(Color.black)
                                    }.actionSheet(isPresented: $showActionSheet) {
                                        ActionSheet(title: Text("Change your profile picture"), message: nil, buttons: [
                                                        .default(Text("Camera"), action: {
                                                            showImagePicker = true
                                                            sourceType = .camera
                                                        }),
                                                        .default(Text("Photo Library"), action: {
                                                            showImagePicker = true
                                                            sourceType = .photoLibrary
                                                        }),
                                            .cancel()
                                        
                                        ])
                                    }.sheet(isPresented: $showImagePicker){
                                        imagePicker(image: $image, showImagePicker: $showImagePicker, sourceType: sourceType)
                                    }
                                    
                                    Button(action: {showChangeName = true}) {
                                        Image(systemName: "pencil")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(Color.black)
                                    }
                                   
                                    if IGName.isEmpty {
                                        Button(action: {showIGChange = true}) {
                                            Image("insta")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .font(.largeTitle)
                                                .frame(width: 25, height: 25)
                                        }
                                    } else {
                                        Link(destination: URL(string: "https://www.instagram.com/"+IGName)!)
                                        {
                                            Image("insta")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .font(.largeTitle)
                                                .frame(width: 25, height: 25)

                                        }
                                    }
                                
                                }
                            }
                        }
                    }
                                    }
             
                HStack(){
                    Text("Posts")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        .font(.system(size: 25))
                    
                    Text("Attending: ")
                    
                    Text("Univerity of Maryland")
                        .font(.system(size: 11, weight: .light, design: .serif))
                        .frame(width: 135, height: 30)
                        .overlay(Capsule().stroke(Color.red, lineWidth: 3))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))

                }
                
                Divider()
                Spacer()
                
                
                ScrollView {
                    
                    let arr = Array(booksInfo.keys)
                    ForEach(0..<arr.count, id: \.self) { book in
                        ProfileView(price: booksInfo[arr[book]]![1], title: booksInfo[arr[book]]![2], user: "ADMIN", className: booksInfo[arr[book]]![0])
                    }
     
                    
                }
                
                
                Spacer()
            }
            .navigationBarHidden(true)
            if showChangeName == true {
                TextAlert(isShown: $showChangeName, name: $name, title: $name1)
            }
            
            if showIGChange == true {
                TextAlert(isShown: $showIGChange, name: $IGName, title: $name2)
            }
        }
            
    }
    
}
struct TextAlert: View {
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    @Binding var name: String
    @Binding var title: String
    var body : some View {
        VStack {
            Text(title)
            TextField("", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                
                Button("Cancel"){
                    self.isShown = false
                }
                
                Button("Done"){
                    self.isShown = false
                }
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 20.0, style: .continuous).stroke(Color.black, lineWidth: 1))
        .offset(y: isShown ? 0 : screenSize.height)
        .animation(.spring())
        
        
    }
}
struct ProfilePage_Previews : PreviewProvider {
    static var previews: some View {
        ProfilePage(booksInfo: .constant([:]))
    }
}

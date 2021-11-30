//
//  UploadPost.swift
//  TerpExchange
//
//  Created by Alexander Quinto on 4/2/21.
//

import Foundation
import Firebase
import SwiftUI


struct UploadPost: View {
    @Binding var show: Bool
    @State var bookTitle = ""
    @State var bookPrice = ""
    @State var bookDescription = ""
    @State var className = ""
    
    //image stuff
    @State var showActionSheet = false
    @State var showImagePicker = false

    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var image: UIImage?
    var body : some View {
        VStack {
            Group {
                HStack {
                    Button(action: {self.show.toggle()}){
                        Text("Cancel")
                            .padding()
                    }
                    Spacer()
                    Button(action: {/* hank would have to write this since this would upload to DB*/
                        
                        //storing book info
                        storeInfoToFire()
                        
                        //uploading photos
                        
                        self.show.toggle()
                        
                    }) {
                        Text("Post")
                            .padding()
                    }
                }
                .foregroundColor(.red)
                .clipShape(Capsule())
            }
            
            Group {
                Divider()
                TextField("Book title (required)", text: $bookTitle)
                Divider()
                HStack {
                    TextField("Class name", text: $className)
                    Divider()
                    TextField("Book price (required)", text: $bookPrice)
                }.frame(height: 25)
                Divider()
                TextEditor(text: $bookDescription)
                    .frame(height: 500)
                Divider()
            }
            
            Group {
                HStack {
                    Text("Choose picture")
                        .font(.caption)
                    Spacer()
                    Button(action: {
                        showActionSheet = true
                    }) {
                        Image(systemName: "camera")
                    }.actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: [
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
                }
                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
        }.padding()
    }
    
    
    func storeInfoToFire () {
        
        let uid = Auth.auth().currentUser?.uid
        
        Firestore.firestore()
            .collection("users").document(uid!)
            .collection("Book Post").document(bookTitle)
            .setData(["title" : bookTitle, "class" : className, "price" : bookPrice, "description" : bookDescription])
        
        
    }
    
    
    
    
    
    
}


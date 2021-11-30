//
//  UploadPost.swift
//  TerpExchange
//
//  Created by Alexander Quinto on 4/2/21.
//

import Foundation
import Firebase
import SwiftUI
import PhotosUI

struct UploadPost: View {
    
    @Binding var booksImage: [String]
    @Binding var booksUIImage: [UIImage?]
    
    @Binding var show: Bool
    @State var bookTitle = ""
    @State var bookPrice = ""
    @State var bookDescription = "Book description..."
    @State var className = ""
    
    @State var numOfPic = 0
    
    //image stuff
    @State var showActionSheet = false
    @State var showImagePicker = false

    @State var sourceType: UIImagePickerController.SourceType = .camera
//    @State var image: UIImage?
    @State var images: [UIImage] = []
    
    //Alert
    @State var showAlert: Bool = false
    @State var bookCat = ""
    
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
                        
                        if bookTitle == "" || bookPrice == ""{
                            showAlert.toggle()
                        } else {
                            //storing book info
                            storeInfoToFire()
                            
                            //uploading photos
                            if images.count != 0 {
                                for i in 0...images.count-1 {
                                    uploadImage(image: images[i], index: i)
                                }
                            }
                            
                            retriImage()
                            
                            self.show.toggle()
                        }
                        
                        
                    }) {
                        Text("Post")
                            .padding()
                            .alert(isPresented: $showAlert, content: {
                                Alert (title: Text ("Unable to Post"), message: Text ("Please fill in all the required field!"), dismissButton: nil)
                            })
                    }
                }
                .foregroundColor(.red)
                .clipShape(Capsule())
            }
            
            Group {
                Divider()
                TextField("Book title (required)", text: $bookTitle)
                Divider()
                TextField("Class category", text: $bookCat)
                Divider()
                HStack {
                    TextField("Class name", text: $className)
                    Divider()
                    TextField("Book price (required)", text: $bookPrice)
                }.frame(height: 25)
                Divider()
                TextEditor(text: $bookDescription)
                    .padding(.top, 2)
                    .foregroundColor(self.bookDescription == "Book description..." ? .gray : .primary)
                    .onTapGesture {
                        if self.bookDescription == "Book description..." {
                            self.bookDescription = ""
                        }
                    }
                
                Divider()
                
                ScrollView (.horizontal, showsIndicators: false, content: {
                    
                    HStack (spacing: 15, content: {
                        
                        ForEach (images, id: \.self) { img in
                            
                            Image (uiImage: img)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                        }
                        
                    })
                    
                }).frame(height: 250)
                
                
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
//                        imagePicker(image: $image, showImagePicker: $showImagePicker, sourceType: sourceType)
                        MultiImagePicker(images: $images, picker: $showImagePicker)
                    }
                }
                Spacer()
            }
//            Spacer()
//            Spacer()
//            Spacer()
//            Spacer()
            
            
        }.padding()
    }
    
    
    func storeInfoToFire () {
        
        let uid = Auth.auth().currentUser?.uid
        
        Firestore.firestore()
            .collection("users").document(uid!)
            .collection("Book Post").document(bookTitle)
            .setData(["title" : bookTitle, "class" : className, "price" : bookPrice, "description" : bookDescription, "category" : bookCat])
        
    }
    
    func uploadImage (image: UIImage, index: Int) {
        
        
        if let imageData = image.jpegData(compressionQuality: 1) {
            
            let uid = Auth.auth().currentUser?.uid
            
            Storage.storage().reference().child("\(String(uid!))/\(bookTitle)/pic\(index)").putData(imageData, metadata: nil) { (_, err) in
                
                if let err = err {
                    print("error occur - \(err.localizedDescription)")
                } else {
                    print("picture successfully uploaded")
                }
                
            }
            
        } else {
            print("error occur while uploading image")
        }
        
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

//struct UploadPost_preview: PreviewProvider {
//    
//    static var previews: some View {
//        UploadPost(show: .constant(true))
//    }
//    
//}



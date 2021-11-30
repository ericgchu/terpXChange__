//
//  ImagePicker.swift
//  TerpExchange
//
//  Created by Alexander Quinto on 4/2/21.
//

import Foundation
import SwiftUI
import PhotosUI

struct imagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showImagePicker: Bool
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = imagePickerCoordinator
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePickerCoordinator(image: $image, showImagePicker: $showImagePicker)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {}
}
class imagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: UIImage?
    @Binding var showImagePicker: Bool
    init(image:Binding<UIImage?>, showImagePicker: Binding<Bool>){
        _image = image
        _showImagePicker = showImagePicker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiimage
            showImagePicker = false
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showImagePicker = false
    }
}


struct MultiImagePicker: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return MultiImagePicker.Coordinator(parent1: self)
    }
    
    @Binding var images: [UIImage]
    @Binding var picker: Bool
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 0
        let picker = PHPickerViewController (configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func  updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }
    
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {

        var parent: MultiImagePicker
        
        init (parent1: MultiImagePicker) {
            parent = parent1
        }
        
        func picker (_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            parent.picker.toggle()
            
            for img in results {
                
                if img.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    
                    img.itemProvider.loadObject(ofClass: UIImage.self) { (image, err) in
                        guard let image1 = image else {
                            print(err!)
                            return
                        }
                        
                        self.parent.images.append(image1 as! UIImage)
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

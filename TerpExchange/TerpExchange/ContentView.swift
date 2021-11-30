//
//  ContentView.swift
//  TerpExchange
//
//  Created by Hank Wu on 3/18/21.
//

import SwiftUI
import Firebase

 
struct MainMenu: View {
    
    @Binding var booksInfo: [String:[String]]
    @Binding var booksImage: [String]
    @Binding var booksUIImage: [UIImage?]

    @State var selection = 0
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                
                MainFeedPage(booksUIImage: $booksUIImage, booksInfo: $booksInfo).tabItem {
                    Image(systemName: "house")
                }.tag(0)
                MessagePage().tabItem {
                    Image(systemName: "envelope")
                }.tag(1)
                ProfilePage(booksInfo: $booksInfo).tabItem {
                    Image(systemName: "person")
                }.tag(2)

                
            } .accentColor(Color.red)
            
            if selection == 0 {
                VStack {
                    HStack {
                        Spacer()
                        searchButton()
                            .padding(.bottom, 65)
                            .padding(.trailing)
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        newPostButton(booksImage: $booksImage, booksUIImage: $booksUIImage)
                            .padding(.bottom, 65)
                            .padding(.trailing)
                    }
                }
            }
        }
    }
    
}


struct  searchButton: View {
    @State var show = false
    var body: some View {
        Button (action: {self.show.toggle()}){
            Image (systemName: "magnifyingglass")
                .resizable()
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 50)
        }
        .background(Color.red)
        .mask(Circle())
        .shadow(radius: 5)
        .sheet(isPresented: $show) {
            Search(show: self.$show)
        }
    }
}


struct newPostButton: View {
    @State var showCreatePost = false
    @Binding var booksImage:[String]
    @Binding var booksUIImage: [UIImage?]
    
    var body: some View {
        
        Button(action: {self.showCreatePost.toggle()}) {
            Image(systemName: "camera")
                .resizable()
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 55)
        }
        .background(Color.red)
        .mask(Circle())
        .shadow(radius: 5)
        .sheet(isPresented: $showCreatePost) {
            UploadPost(booksImage: $booksImage, booksUIImage: $booksUIImage, show: self.$showCreatePost)
        }
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenu(booksInfo: .constant([:]), booksUIImage: .constant([]))
//    }
//}

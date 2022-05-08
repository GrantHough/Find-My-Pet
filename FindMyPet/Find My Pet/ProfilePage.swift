//
//  ProfilePage.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct ProfilePage: View {
    
    var name: String
    var imageName: String
    var location: String
    @ObservedObject var postListViewModel: PostListViewModel
    @State private var showingForm = false
    @State private var found = false
    
    var body: some View {
        
        VStack {
            
            RoundedRectangle(cornerRadius: 40)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.37), Color.purple.opacity(0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: UIScreen.main.bounds.width * 1.02, height: UIScreen.main.bounds.height * 0.40)
                .overlay (
                    VStack {
                        
                        Spacer()
                            .frame(height: 24)
                        
                        Image(imageName)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.width - 200)
                            .cornerRadius(1000)
                            .shadow(radius: 10)
                        Text(name)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Color.black.opacity(0.80))
                            .shadow(radius:10)
                        
                        Text(location)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.black.opacity(0.80))
                            .shadow(radius:3)
                            
                    }
                )
            
            Text("User's Posts")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.black.opacity(0.80))
                .shadow(radius:10)
                .padding(3)
            
            ScrollView {
                
                Spacer()
                    .frame(height: 10)
                
                ForEach(postListViewModel.postViewModels.filter {
                    $0.post.found == found}) { postVM in PostUI(postViewModel: postVM)
                    }
                
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.4)
            .background(Color.black.opacity(0.1))
            .cornerRadius(25)
            .listStyle(InsetListStyle())
            .shadow(radius: 12)
            .padding(.bottom, 12)
            
            
        }
        .ignoresSafeArea()
        
    }
}

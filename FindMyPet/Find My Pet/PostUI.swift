//
//  PostUI.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct PostUI: View {
    
    var postViewModel: PostViewModel
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 16)
            .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.24), Color.purple.opacity(0.36)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 8)
            .background(Color.white.opacity(0.9))
            .cornerRadius(16)
        
            .frame(width: UIScreen.main.bounds.width - 40, height: 140)
            .overlay(
                ZStack {
                    
                    HStack (spacing: 0) {
                        
                        VStack (alignment: .leading) {
                            
                            if (postViewModel.post.found) {
                                
                                Text("Sighted " + postViewModel.post.name)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color.black.opacity(0.80))
                                    .shadow(radius:3)
                                
                            }
                            
                            Text("Name: " + postViewModel.post.name)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color.black.opacity(0.80))
                                .shadow(radius:3)
                            Text("Species: " + postViewModel.post.animal)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color.black.opacity(0.80))
                                .shadow(radius:3)
                            Text("Seen Last At: " + postViewModel.post.location + " at " + postViewModel.post.lastSeen)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color.black.opacity(0.80))
                                .shadow(radius:3)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        Image("116Dog")
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .padding()
                        
                    }
                }
                
            )
        
    }
}


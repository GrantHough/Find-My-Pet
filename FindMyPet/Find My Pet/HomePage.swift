//
//  HomePage.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct HomePage: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.black.opacity(0.1))
        }
    
    var body: some View {
        
        NavigationView {
            
            TabView {
                
                PostView(postListViewModel: PostListViewModel())
                    .tabItem {
                        Image(systemName: "book")
                        Text("Posts")
                    }
                
                ZStack{
                    
                    Color(.white)
                        
                    VStack {
                        
                        ProfilePage(name: "Grant Hough", imageName: "RealPFP", location: "1234 Hacker Street, California", postListViewModel: PostListViewModel())
                        
                    }
                    .ignoresSafeArea()
                }
                .ignoresSafeArea()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                
                Settings()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

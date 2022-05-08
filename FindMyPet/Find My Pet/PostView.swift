//
//  PostView.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var postListViewModel: PostListViewModel
    @State private var showingForm = false
    @State private var found = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("Current Posts")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(Color.black.opacity(0.85))
                    .shadow(radius:1)
                    .padding(.leading)
                    .padding(.trailing)
                    .multilineTextAlignment(.center)
                    .edgesIgnoringSafeArea(.top)
                
                Toggle(isOn: $found) {Text ("Animals that have been" + "\(found ? " lost:" : " found:")")}
                    .padding(.leading)
                    .padding(.trailing)
                
    
                ScrollView {
                    
                    Spacer()
                        .frame(height: 10)
                    
                    ForEach(postListViewModel.postViewModels.filter {
                        $0.post.found == found}) { postVM in PostUI(postViewModel: postVM)
                        }
                    
                }
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.5)
                .background(Color.black.opacity(0.1))
                .cornerRadius(25)
                .listStyle(InsetListStyle())
                .shadow(radius: 12)
                .padding(.bottom, 12)
                
                
                Button(action: {
                    showingForm = true
                }) {
                    GradientButtonView(text: "Create a New Post", gradient: LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.37), Color.purple.opacity(0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                       , textColor: Color.white.opacity(0.9), offsetWidth: 50, offsetHeight: 0.07)
                }
                .sheet(isPresented: $showingForm) {
                    FormView { (offer) in
                        postListViewModel.add(offer)
                        showingForm = false
                    }
                }
                .shadow(radius: 5)
                
                
            }
            
        }
    }
    
    
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postListViewModel: PostListViewModel())
    }
}

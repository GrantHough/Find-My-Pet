//
//  SignUpView.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color(.white)
                
                VStack {
                    
                    Text("Sign Up")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(Color.black.opacity(0.85))
                        .shadow(radius:10)
                        .padding(.leading)
                        .padding(.trailing)
                        .multilineTextAlignment(.center)
                    
                    TextField("Email Address", text: $email)
                        .padding(.leading)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.07)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(Color.white.opacity(0.8))
                        .cornerRadius(20)
                        .shadow(radius:5)
                        .padding(.bottom, 5)
                    
                    SecureField("Password", text: $password)
                        .padding(.leading)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.07)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(Color.white.opacity(0.8))
                        .cornerRadius(20)
                        .shadow(radius:5)
                        .padding(.bottom, 5)
                    
                }
                .ignoresSafeArea()
                    
            }
            .ignoresSafeArea()
            .onTapGesture {
                hideKeyboard()
            }
        }
        .navigationBackButton(color: .blue, text: "Back")
        .navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

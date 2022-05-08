//
//  SignInView.swift
//  Find My pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            
            ZStack {
                
                Color(.white)
                
                VStack {
                    
                    Image("lost")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 1.03, height: UIScreen.main.bounds.height * 0.35, alignment: .center)
                        .cornerRadius(50)
                        .shadow(radius: 10)
                        .padding(.bottom, 15)
                        .saturation(0)
                        .overlay(
                            Rectangle()
                                .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.purple.opacity(1)]), startPoint: .bottom, endPoint: .topLeading))
                                .frame(width: UIScreen.main.bounds.width * 1.03, height: UIScreen.main.bounds.height * 0.35, alignment: .center)
                                .cornerRadius(50)
                                .padding(.bottom, 15)
                                .opacity(0.35)
                        )
                    
                    Text("Welcome Back!")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(Color.black.opacity(0.85))
                        .shadow(radius:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .multilineTextAlignment(.center)
                    
                    TextField("Email Address", text: $email)
                        .padding(.leading)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.07)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(Color.black.opacity(0.8))
                        .cornerRadius(20)
                        .shadow(radius:5)
                        .padding(.bottom, 5)
                    
                    SecureField("Password", text: $password)
                        .padding(.leading)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.07)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(Color.black.opacity(0.8))
                        .cornerRadius(20)
                        .shadow(radius:5)
                        .padding(.bottom, 5)
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else{
                            //self.viewModel.signInAlert = true
                            return()
                        }
                        
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        
                        GradientButtonView(text: "Sign In", gradient: LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.37), Color.purple.opacity(0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing), textColor: Color.white.opacity(0.9), offsetWidth: 50, offsetHeight: 0.07)
                            .padding(.bottom, 5)
                        
                    })
                    .shadow(radius:5)
                    
                    Text("Forgot your password?")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Color.blue.opacity(1))
                        .shadow(radius:10)
                        .padding(.leading)
                        .padding(.trailing)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 150)
                    
                    HStack (spacing: 0) {
                        Text("Don't have an account? ")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.black.opacity(0.80))
                            .shadow(radius:10)
                        NavigationLink("Sign Up!", destination: SignUpView())
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.blue.opacity(1))
                            .shadow(radius:10)
                    }
                    
                    
                }
                .ignoresSafeArea()
                
            }
            .ignoresSafeArea()
            .onTapGesture {
                self.hideKeyboard()
            }
    
    }
    
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


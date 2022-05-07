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
    
    var body: some View {
        
        NavigationView {
           
            ZStack {
                
                Color(.white)
                
                VStack {
                    
                    Image("dog")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 1.05, height: UIScreen.main.bounds.height * 0.35, alignment: .center)
                        .cornerRadius(50)
                        .saturation(0)
                    
                    Text("Login")
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
         
                    GradientButtonView(text: "Sign In", gradient: LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.37), Color.purple.opacity(0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing), textColor: Color.white.opacity(0.9), offsetWidth: 80, offsetHeight: 0.07)
                        .padding(.bottom, 5)
                         
                    
                }
                .ignoresSafeArea()
                
            }
            .ignoresSafeArea()
        }
        .navigationBackButton(color: .white, text: "Back")
    }
    
}
   

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


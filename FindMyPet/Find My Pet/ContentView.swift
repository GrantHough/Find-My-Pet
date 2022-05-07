//
//  ContentView.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI
import FirebaseAuth
import Firebase

class AppViewModel: ObservableObject {
    
    
    @Published var signedIn = false
    @State var isSuccessful = false
    
    let auth = Auth.auth()
    
    func signIn(email: String, password: String) { //login
           auth.signIn(withEmail: email, password: password) { [weak self] (result, error) in
               
               
               if error != nil {
                   //erroralert
               }
             
               else {
                   self?.isSuccessful = true
                   print("Signed In")
               }
            
               guard result != nil, error == nil else {
                   //self?.alertIsShowing = true
                   return
               }
               
               DispatchQueue.main.async {
                   self?.signedIn = true
               }
           }
       }
    
    func signUp(email: String, password: String) {
            auth.createUser(withEmail: email, password: password) { [weak self] result, error in
                
                if error != nil {
                    //self?.signInAlert = true
                }
                
                guard result != nil, error == nil else {
                    //self?.alertIsShowing = true
                    return
                }
                
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
                
            }
        }
    
    func resetPassword(email: String, resetCompletion: @escaping (Result<Bool,Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            
            if error != nil {
                //self.resetAlert = true
            }
            
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
        })
    }
    
    func signOut() {
            try? auth.signOut()
            self.signedIn = false
        }
    
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
//        if (viewModel.signedIn) {
//
//            HomePage()
//
//        }
//
//        else {
//
            WelcomePage()
     
//        }
//
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



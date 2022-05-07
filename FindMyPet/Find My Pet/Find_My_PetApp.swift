//
//  Find_My_PetApp.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//  

import SwiftUI
import FirebaseAuth
import Firebase

@main
struct Find_My_PetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct NavigationBackButton: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?

    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true) //gets rid of original default back button
            .navigationBarItems(
                
                leading: Button(action: {presentationMode.wrappedValue.dismiss() }, label: {
                    
                    HStack(spacing: 2) {
                        
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color)) // new back button

                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                        }
                    }
                })
            )
    }
}

extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
        
    }
}

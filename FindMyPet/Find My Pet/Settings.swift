//
//  Settings.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        Button(action: {
            
            viewModel.signOut()
            
        }, label: {
            
            GradientButtonView(text: "Sign Out", gradient: LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.37), Color.purple.opacity(0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing), textColor: Color.white.opacity(0.9), offsetWidth: 50, offsetHeight: 0.07)
                .padding(.bottom, 5)
            
        })
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

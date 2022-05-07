//
//  WelcomePage.swift
//  Find My pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack (spacing: 0) {
            Text("Welcome to")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color.black.opacity(0.3))
            TextShimmer(text: "Find My Pet")
            
           
        }
    }
}

struct WelcomePage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            
            WelcomePage()
            
        }
    }
}


struct TextShimmer: View {
    
    var text: String
    @State var animation = false
    
    var body: some View {
        
        ZStack {
            
            Text(text)
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(Color.black.opacity(0.38))
            
            HStack (spacing: 0) {
                
                ForEach(0..<text.count, id: \.self) {index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(randomColor())
                    
                    
                }
                
            }
            .mask(
                
                Rectangle()
                    .fill (
                        
                        LinearGradient(gradient:.init(colors: [Color.black.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
                        
                    )
                
                    .rotationEffect(.init(degrees:80))
                    .padding(-40)
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
                
            )
            
            .onAppear(perform: {
                
                withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false)) {
                    
                    animation.toggle()
                    
                }
                
            })
            
        }
        
    }
    
    func randomColor()->Color {
        
        let color = UIColor(red: 0, green: CGFloat.random(in: 0.09...0.5), blue: CGFloat.random(in: 0.5...0.99), alpha: 1)
        
        return Color(color)
        
    }
    
    
}

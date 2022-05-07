//
//  WelcomePage.swift
//  Find My pet
//
//  Created by Grant Hough on 5/7/22.
//

import SwiftUI

func randomColor()->Color {
    
    let color = UIColor(red: 0, green: CGFloat.random(in: 0.1...0.6), blue: CGFloat.random(in: 0.3...0.8), alpha: 1)
    
    return Color(color)
    
}

struct WelcomePage: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.37), Color.purple.opacity(0.45)]), startPoint: .top, endPoint: .bottomLeading)
                
                VStack (spacing: 0) {
                    
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                    
                    //                Text("Welcome to")
                    //                    .font(.system(size: 30, weight: .bold))
                    //                    .foregroundColor(Color.black.opacity(0.3))
                    //                    .shadow(radius:10)
                    
                    Image("petclipart")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45, alignment: .center)
                        .cornerRadius(36, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.top, 20)
                        .shadow(radius: 8)
                        .padding(.bottom, 5)
                    
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                    
                    Text("Find My Pet")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(Color.white.opacity(0.85))
                        .shadow(radius:10)
                        .padding(.leading)
                        .padding(.trailing)
                        .multilineTextAlignment(.center) //had this as animated but it was glitching
                    
                    Text("Pairing ML with the \ncommunity to find lost pets")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.white.opacity(0.75))
                        .shadow(radius:10)
                        .padding(.leading)
                        .padding(.trailing)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: SignInView()) {
                        ButtonView(text: "Continue", color: Color.white.opacity(0.9), textColor: Color.black.opacity(0.8), offsetWidth: 120, offsetHeight: 0.07)
                    }
                        .padding()
                    
                }
                
            }
            
            .ignoresSafeArea()
            
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
    var size: Int
    @State var animation = false
    
    var body: some View {
        
        ZStack {
            
            Text(text)
                .font(.system(size: CGFloat(size), weight: .bold))
                .foregroundColor(Color.black.opacity(0.35))
            
            HStack (spacing: 0) {
                
                ForEach(0..<text.count, id: \.self) {index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: CGFloat(size), weight: .bold))
                        .foregroundColor(randomColor())
                        .opacity(0.3)
                    
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
    
}

struct ButtonView:View {
    
    var text: String
    var color: Color
    var textColor: Color
    var offsetWidth: Int
    var offsetHeight: Double
    
    
    var body: some View {
        
        HStack {
            
            Image("")
            
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(textColor)
            
        }
        .frame(width: UIScreen.main.bounds.width - CGFloat(offsetWidth), height: UIScreen.main.bounds.height * offsetHeight)
        .background(color)
        .cornerRadius(25, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .opacity(0.98)
        .shadow(radius: 10)
        
    }
    
}

struct GradientButtonView:View {
    
    var text: String
    var gradient: LinearGradient
    var textColor: Color
    var offsetWidth: Int
    var offsetHeight: Double
    
    
    var body: some View {
        
        HStack {
            
            Image("")
            
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(textColor)
            
        }
        .frame(width: UIScreen.main.bounds.width - CGFloat(offsetWidth), height: UIScreen.main.bounds.height * offsetHeight)
        .background(gradient)
        .cornerRadius(25, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .opacity(0.98)
        .shadow(radius: 10)
        
    }
    
}

//
//  FormView.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//
import CoreLocation
import CoreLocationUI
import SwiftUI

struct FormView: View {
    
    @State private var found = false
    @State private var name: String = ""
    @State private var animal: String = ""
    @State private var location: String = ""
    @State private var timeAgoSeen: String = ""
    @State var isPresenting: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var uiImage: UIImage?
    
    var didAddPost: (_ post: Post) -> Void
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                VStack (alignment: .leading){
                    
                    Text("Create a Post")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(Color.black.opacity(0.85))
                        .shadow(radius:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .multilineTextAlignment(.center)
                    
                    Group {
                        
                        Text("Has the animal been found or lost?")
                            .padding(.leading)
                            .padding(.trailing)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top, 3)
                        Toggle(isOn: $found) {Text ("This animal has been" + "\(found ? " lost." : " found.")")}
                            .padding(.leading)
                            .padding(.trailing)
                            .tint(Color.gray.opacity(0.5))
                        Text("What is your name?")
                            .padding(.leading)
                            .padding(.trailing)
                            .font(.system(size: 16, weight: .semibold))
                        TextField("Name", text: $name)
                            .padding(.leading)
                            .padding(.trailing)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.04)
                            .background(Color.black.opacity(0.05))
                            .foregroundColor(Color.black.opacity(0.8))
                            .cornerRadius(20)
                            .shadow(radius:5)
                            .padding(.bottom, 5)
                            .padding(.leading)
                            .padding(.trailing)
                        
                        
                        Text("What type of animal is this? (include breed if known)")
                            .padding(.leading)
                            .padding(.trailing)
                            .font(.system(size: 16, weight: .semibold))
                        TextField("Animal/Species", text: $animal)
                            .padding(.leading)
                            .padding(.trailing)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.04)
                            .background(Color.black.opacity(0.05))
                            .foregroundColor(Color.black.opacity(0.8))
                            .cornerRadius(20)
                            .shadow(radius:5)
                            .padding(.bottom, 5)
                            .padding(.leading)
                            .padding(.trailing)
                        
                        
                    }
                    Group {
                        Text("What is your address? Click the button below to autofill your current location.")
                            .padding(.leading)
                            .padding(.trailing)
                            .font(.system(size: 16, weight: .semibold))
                        TextField("Nearest Location", text: $location)
                            .padding(.leading)
                            .padding(.trailing)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.04)
                            .background(Color.black.opacity(0.05))
                            .foregroundColor(Color.black.opacity(0.8))
                            .cornerRadius(20)
                            .shadow(radius:5)
                            .padding(.bottom, 5)
                            .padding(.leading)
                            .padding(.trailing)
                        
                        Text("When did you last see the animal? (date)")
                            .padding(.leading)
                            .padding(.trailing)
                            .font(.system(size: 16, weight: .semibold))
                        TextField("Time Last Spotted", text: $timeAgoSeen)
                            .padding(.leading)
                            .padding(.trailing)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.04)
                            .background(Color.black.opacity(0.05))
                            .foregroundColor(Color.black.opacity(0.8))
                            .cornerRadius(20)
                            .shadow(radius:5)
                            .padding(.bottom, 5)
                            .padding(.leading)
                            .padding(.trailing)
                        
                        Text("Do you have a picture of the animal?")
                            .padding(.leading)
                            .padding(.trailing)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    
                    
                }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.purple.opacity(1)]), startPoint: .bottom, endPoint: .topLeading))
                        .overlay(
                            Group {
                                if (uiImage != nil) {
                                    Image(uiImage: uiImage!)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(20)
                                }
                                
                            }
                        )
                        .frame(width: 250, height: 250)
                        .padding(.bottom)
                    HStack {
                        
                        Image(systemName: "photo")
                            .onTapGesture {
                                
                                isPresenting = true
                                sourceType = .photoLibrary
                                
                            }
                        
                        Image(systemName: "camera")
                            .onTapGesture {
                                
                                isPresenting = true
                                sourceType = .camera
                                
                            }
                        
                    }
                    
                    
                    Button("Create Post") {
                        
                        let post = Post(name: name, location: location, animal: animal, lastSeen: timeAgoSeen)
                        didAddPost(post)
                    }
                    .disabled(animal.isEmpty || location.isEmpty)
                    .padding()
                }
            }
            .sheet(isPresented: $isPresenting) {ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                
                
            }
        }
    }
}


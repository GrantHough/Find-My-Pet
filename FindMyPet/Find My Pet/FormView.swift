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
            
            VStack {
                
                Text("Create a Post")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(Color.black.opacity(0.85))
                    .shadow(radius:1)
                    .padding(.leading)
                    .padding(.trailing)
                    .multilineTextAlignment(.center)
                
                Group {
                    
                    Text("Is this post for an animal that has been found or lost?")
                    Toggle(isOn: $found) {Text ("This animal has been" + "\(found ? " lost" : " found")")}
                    
                    Text("What is your name?")
                    TextField("Name", text: $name)
                    
                    Text("What type of animal is this? (include breed if known)")
                    TextField("Animal/Species", text: $animal)
                    
                    
                }
                Text("What is your address? Click the button below to autofill your current location.")
                TextField("Nearest Location", text: $location)
                
                Text("When did you last see the animal? (date)")
                TextField("Time Last Spotted", text: $timeAgoSeen)
                
                Text("Do you have a picture of the animal?")
                
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
                
                if uiImage != nil {
                    Image(uiImage: uiImage!)
                        .resizable()
                        .scaledToFit()
                }
                
                Button("Create Post") {
                    
                    let post = Post(name: name, location: location, animal: animal, lastSeen: timeAgoSeen)
                    didAddPost(post)
                }
                .disabled(animal.isEmpty || location.isEmpty)
                .padding()
                
            }
            .sheet(isPresented: $isPresenting) {ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                
            }
        }
    }
}


//
//  ListingRepository.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class PostRepository: ObservableObject {
    
    private let store = Firestore.firestore()
    private let path = "posts"
    @Published var posts: [Post] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    print(error)
                    return
                }
                self.posts = snapshot?.documents.compactMap {
                    try? $0.data(as: Post.self)
                } ?? []
            }
    }
    
    func add(_ post: Post) {
        
        do {
            
            _ = try store.collection(path).addDocument(from: post)

        } catch {
        
            fatalError("Creating a post failed.")
            
        }
        
    }
    func remove(_ post: Post) {
        
        guard let documentId = post.id  else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to delete post.")
            }
        }
        
    }
    
    func update(_ post: Post) {
        guard let documentId = post.id  else { return }
            do {
                     
                try store.collection(path).document(documentId).setData(from: post)
                
            } catch {
                
                fatalError("Updating a post failed.")
                
            }
        
    }
    
}

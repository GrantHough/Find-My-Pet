//
//  PostViewModel.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import Combine

final class PostViewModel: ObservableObject, Identifiable {
    
    private let postRepository = PostRepository()
    @Published var post: Post
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(post: Post) {
        
        self.post = post
        $post
            .compactMap{ $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}



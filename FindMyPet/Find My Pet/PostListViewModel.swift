//
//  PostingViewModel.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import Combine

final class PostListViewModel: ObservableObject {
    
    @Published var postRepository = PostRepository()
    @Published var postViewModels: [PostViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        
        postRepository.$posts
            .map { posts in
                posts.map(PostViewModel.init)
            }
            .assign(to: \.postViewModels, on: self)
            .store(in: &cancellables)
        
    }
    
    func add(_ post: Post) {
        
        postRepository.add(post)
        
    }
    
    func remove(_ post: Post) {
        postRepository.remove(post)
    }
    
    func update(_ post: Post) {
        postRepository.update(post)
    }
    
    
    
    
}

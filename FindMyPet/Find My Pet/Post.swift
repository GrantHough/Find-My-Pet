//
//  Listing.swift
//  Find My Pet
//
//  Created by Grant Hough on 5/7/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var found = false
    var name: String
    var location: String
    var animal: String
    var lastSeen: String
    
}


//
//  UserModel.swift
//  
//
//  Created by 18391981 on 17.10.2020.
//

import SwiftUI
import FirebaseFirestore


public struct UserModel: Hashable, Decodable {
    
    public var username: String
    public var firstName: String
    public var lastName: String
    public var pic: String
    public var bio: String
    public var uid: String
    
    public init(username: String, firstName: String, lastName: String, pic: String, bio: String, uid: String) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.pic = pic
        self.bio = bio
        self.uid = uid
    }
    
    public init?(document: DocumentSnapshot) {
        
        guard let data = document.data() else { return nil}
        let username = data["username"] as? String
        let firstName = data["firstName"] as? String
        let lastName = data["lastName"] as? String
        let pic = data["imageurl"] as? String
        let bio = data["bio"] as? String
        let uid = data["uid"] as? String
        
        self.username = username ?? ""
        self.firstName = firstName ?? ""
        self.lastName = lastName ?? ""
        self.pic = pic ?? ""
        self.bio = bio ?? ""
        self.uid = uid ?? ""
    }
}

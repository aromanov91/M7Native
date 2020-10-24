//
//  UserModel.swift
//  
//
//  Created by 18391981 on 17.10.2020.
//


import Foundation
import FirebaseFirestoreSwift

public struct UserModel: Identifiable, Codable {
    
    @DocumentID public var id: String?
    public var username: String
    public var firstName: String
    public var lastName: String
    public var pic: String
    public var bio: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case firstName
        case lastName
        case pic
        case bio
      }
    
}

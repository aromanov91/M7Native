//
//  File.swift
//  
//
//  Created by 18391981 on 17.10.2020.
//

import Combine
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

public class AuthenticationService: ObservableObject{
    
    @Published public var user = UserModel(username: "", firstName: "", lastName: "", pic: "", bio: "", uid: "")
    
    public var status: Bool {
        set { UserDefaults.standard.set(newValue, forKey: "Auth.Status") }
        get { UserDefaults.standard.bool(forKey: "Auth.Status") }
    }
    
    // Image Picker For Updating Image...
    @Published public var picker = false
    @Published public var img_data = Data(count: 0)
    
    // Loading View..
    @Published public var isLoading = false
    
    public let ref = Firestore.firestore()
    public var uid = Auth.auth().currentUser?.uid ?? ""
    
    public init() {
        
        if status {
            
            fetchUser(uid: uid) { (user) in
                self.user = user
            }
            
        }
    }
    
    
    public func logOut(){
        
        // logging out..
        
        try! Auth.auth().signOut()
        status = false
    }
    
    
    
    public func fetchUser(uid: String,completion: @escaping (UserModel) -> Void) {
        
        ref.collection("users").document(uid).getDocument { (doc, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
                
            } else {
                
                print("Fetch Success")
                
                guard let document = doc else { return }
                
                DispatchQueue.main.async {
                    completion(UserModel(document: document) ??  UserModel(username: "", firstName: "", lastName: "", pic: "", bio: "", uid: ""))
                }
            }
        }
    }
    
}

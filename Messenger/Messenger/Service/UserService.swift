//
//  UserService.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/8/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print( print ("DEBUG: Failed to create user with error: \(currentUser)"))
        
        
    }
    
    static func fatchAllUsers(limit: Int? = nil) async throws -> [User] {
        let query = FirestoreContants.UserCollection
        if let limit {query.limit(to: limit)}
        let snapshot = try await query.getDocuments()
      return snapshot.documents.compactMap({try? $0.data(as: User.self)})
      
    }
    
    static func fatchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        FirestoreContants.UserCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
            
        }
    }
}

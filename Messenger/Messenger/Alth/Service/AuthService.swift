//
//  AuthService.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/7/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    init() {
        
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        print("DEBUG: User session id is \(userSession?.uid  )")
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print ("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    @MainActor
    func CreateUser(withEmail email: String, password: String, fullname: String) async throws {
        do{
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
        } catch {
            print ("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print ("DEBUG: Failed to signOut user with error: \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    private func loadCurrentUserData() {
    Task {try await UserService.shared.fetchCurrentUser()}
}
}

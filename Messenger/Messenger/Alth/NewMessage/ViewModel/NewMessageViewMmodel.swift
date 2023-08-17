//
//  NewMessageViewMmodel.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/11/23.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewMmodel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task{try await fatchUsers() }
    }
func fatchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
       
        let users =  try await UserService.fatchAllUsers()
        self.users = users.filter({ $0.id != currentUid })
    }
}

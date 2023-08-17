//
//  ActiveNowViewModel.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/16/23.
//

import Foundation
import Firebase
class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    init() {
        Task { try await fatchUsers() }
        
    }
    @MainActor
    private func fatchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
       
        let users =  try await UserService.fatchAllUsers(limit: 10)
        self.users = users.filter({ $0.id != currentUid })

    }
}

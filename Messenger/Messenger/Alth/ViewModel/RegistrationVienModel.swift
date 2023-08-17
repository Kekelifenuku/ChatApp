//
//  RegistrationVienModel.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/7/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
class RegistrationViewModel: ObservableObject {

@Published var email = ""
@Published var password = ""
@Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.CreateUser(withEmail: email, password: password, fullname: fullname)
    }
    
}

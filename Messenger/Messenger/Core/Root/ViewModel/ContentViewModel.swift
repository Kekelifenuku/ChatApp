//
//  ContentViewModel.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/8/23.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    public var cancellables = Set<AnyCancellable>()
    init() {
       setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
            
        }.store(in: &cancellables)
    }
}

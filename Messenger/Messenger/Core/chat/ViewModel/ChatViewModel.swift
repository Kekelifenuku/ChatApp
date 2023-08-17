//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/12/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    
  
    let service: ChatService
    
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessage(){ messages in
            self.messages.append(contentsOf: messages)
        }
            
    }
    
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
}

//
//  ChatService.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/14/23.
//

import Foundation
import Firebase

struct ChatService {
    
      
    let chatPartner: User
    
   func sendMessage(_ messageText: String) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        
       let currentUserRef = FirestoreContants.MessageCollection.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = FirestoreContants.MessageCollection.document(chatPartnerId).collection(currentUid)
       let recentCurrentUser = FirestoreContants.MessageCollection.document(currentUid).collection("recent-messages").document(chatPartnerId)
        
       let recentPartnerRef = FirestoreContants.MessageCollection.document(chatPartnerId).collection("recent-messages").document(currentUid)
       
       
        let messageId = currentUserRef.documentID
        
        
        let message = Message(
        messageId: messageId,
        fromId: currentUid,
        told: chatPartnerId,
        messageText: messageText,
        timestamp: Timestamp()
        )

        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    
       recentCurrentUser.setData(messageData)
       recentPartnerRef.setData(messageData)
       
    }
      func observeMessage( completion: @escaping([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        let query = FirestoreContants.MessageCollection
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        
        query.addSnapshotListener { Snapshot, _ in
            guard let changes = Snapshot?.documentChanges.filter({ $0.type == .added}) else { return }
            var messages = changes.compactMap({ try? $0.document.data(as: Message.self)})
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = chatPartner
            }
            
            completion(messages)
        }
    }
}

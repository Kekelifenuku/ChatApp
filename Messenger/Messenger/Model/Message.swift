//
//  Message.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/12/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let told: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    var chatpartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? told : fromId
    }
    var isfromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
}

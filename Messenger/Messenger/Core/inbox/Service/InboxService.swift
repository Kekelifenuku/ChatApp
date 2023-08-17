//
//  InboxService.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/15/23.
//

import Foundation
import Firebase

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirestoreContants
            .MessageCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp" , descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
                
            }) else { return }
            
            
            self.documentChanges = changes
        }
    }
}

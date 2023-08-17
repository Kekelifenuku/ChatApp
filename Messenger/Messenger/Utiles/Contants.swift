//
//  Contants.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/14/23.
//

import Foundation
import Firebase

struct FirestoreContants {
  static  let UserCollection = Firestore.firestore().collection("users")
  static  let MessageCollection = Firestore.firestore().collection("messages")
}

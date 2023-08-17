//
//  Route.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/16/23.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case ChatView(User)
}

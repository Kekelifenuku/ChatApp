//
//  MessengerApp.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/4/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MessengerApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var delegate
//    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
        ContentView()
//                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

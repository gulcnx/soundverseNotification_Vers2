//
//  SoundverseNotificationApp.swift
//  SoundverseNotification
//
//  Created by gülçin çetin on 26.02.2025.
//

import SwiftUI

@main 
struct SoundverseNotificationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        NotificationManager.shated.requestPermission()
    }
    var body: some Scene {
        WindowGroup {
            ChatView()
        }
    }
}

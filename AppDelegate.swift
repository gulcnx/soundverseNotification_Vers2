//
//  AppDelegate.swift
//  SoundverseNotification
//
//  Created by gülçin çetin on 27.02.2025.
//

import UIKit
import UserNotifications

class AppDelegate : UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application : UIApplication, didFinishLaunchingWithOptions launchOptions : [
        UIApplication.LaunchOptionsKey : Any
    ]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler : @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}

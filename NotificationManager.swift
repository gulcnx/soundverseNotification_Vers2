//
//  NotificationManager.swift
//  SoundverseNotification
//
//  Created by gülçin çetin on 27.02.2025.
//

import UserNotifications
import SwiftUI

class NotificationManager {
    static let shated = NotificationManager()
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting permission: \(error)")
            } else {
                print("Permission granted: \(granted)")
            }
        }
    }
    
    func scheduleNotification(title: String, body: String, delay: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delay, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
     
        UNUserNotificationCenter.current().add(request) {
            error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
        
    }
}

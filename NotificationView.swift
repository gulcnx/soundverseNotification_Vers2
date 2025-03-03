//
//  NotificationView.swift
//  SoundverseNotification
//
//  Created by gülçin çetin on 26.02.2025.

import SwiftUI

struct NotificationView: View {
    let notifications = [
        "New message from Yennefer",
        "Jen liked your post",
        "You have a new follower",
        "New comment on your photo",
        "You have a new notification"
    ]
    
    var body: some View {
        NavigationView {
            List(notifications, id: \.self) {notification in
                NavigationLink(destination: ExportSuccessfulView()) {
                    Text("Go to Export Successful Screen")
                }
                    HStack(spacing: 12) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .background(Color.yellow)
                        
                        Text(notification)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding(.vertical, 8)
                    }.background(Color.blue.opacity(0.3))
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Notifications")
        }
    }

struct NotificationDetailView: View {
    let message: String
    @State private var showDummyNotification = false
    
    var body: some View {
        VStack {
            Text(message)
                .font(.headline)
                .padding()
            
            if showDummyNotification {
                Text("New notification! 🛎️")
                    .foregroundStyle(.red)
                    .padding()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showDummyNotification = true
            }
        }
        .navigationTitle("Details")
    }
}

struct NotificationView_Previews : PreviewProvider {
    static var previews: some View{
        NotificationView()
    }
}

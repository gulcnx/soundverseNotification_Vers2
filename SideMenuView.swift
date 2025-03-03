//
//  SideMenuView.swift
//  SoundverseNotification
//
//  Created by gülçin çetin on 27.02.2025.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Menu")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)
                .foregroundColor(.black)
       
            Button(action: {
                print("Settings tapped")
            }) {
                Label("Settings", systemImage: "gear")
            }.padding()
                .foregroundColor(.black)
            
            Spacer()
        }
        .frame(maxWidth: 250, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SideMenuView()
}

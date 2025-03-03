//
//  ExportSuccessfulView.swift
//  SoundverseNotification
//
//  Created by gülçin çetin on 2.03.2025.
//
import SwiftUI

struct ExportSuccessfulView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Ready to share")
                . font(.system(size: 30))
                .bold()
                .foregroundColor(.black)
                .padding()
            
            Text("Saved to device and your library")
                .font(.system(size: 20))
                .bold()
            
            Image("Image")
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
            
                .padding()

            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    shareToInstagram()
                }) {
                    Text("Share to Instagram Stories")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.mint)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding()
            }
        }.background(Color.blue.opacity(0.3))
            }

    func shareToInstagram() {
        if let videoURL = Bundle.main.url(forResource: "dummy_video", withExtension: "mp4") {
            let activityViewController = UIActivityViewController(activityItems: [videoURL], applicationActivities: nil)
            
            if let rootVC = UIApplication.shared.windows.first?.rootViewController {
                rootVC.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
}

struct ExportSuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        ExportSuccessfulView()
    }
}

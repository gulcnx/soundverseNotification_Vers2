import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Menu")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)
                .foregroundColor(.black)
            
            Button(action: {
                print("Settings tapped")
            }) {
                Label("Settings", systemImage: "gear")
            }
            .padding()
            .foregroundColor(.black)
            
            Spacer()
        }
        .frame(width: 250)
        .frame(maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
        .offset(x: -100) // This is how we stick the menu bar to left !
    }
}


import SwiftUI

struct ChatView: View {
    @State private var notificationMessage: String = ""
    @State private var showAlert = false
    @State private var showMenu = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView{
                    VStack(alignment: .trailing, spacing: 20){
                        ChatBubble(message: "Hi! How are you today?")
                        ChatBubble(message: "Hope you are doing great! <3 ")
                        ChatBubble(message: "Are you looking for something?")
                    }
                    .padding()
                    .bold()
                }
                Spacer()
            }
            .navigationTitle("Soundverse")
            .background(Color.blue.opacity(0.2))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation{
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 25, height: 20)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NotificationView()) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            .onAppear {
                UNUserNotificationCenter.current().delegate = UIApplication.shared.delegate as? UNUserNotificationCenterDelegate
            }
            
            .alert(isPresented : $showAlert) {
                Alert(title: Text("Notification"), message: Text(notificationMessage), dismissButton: .default(Text("OK")))
            }
        }
        .overlay(
            ZStack{
                if showMenu {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation{
                                showMenu = false
                            }
                        }
                    SideMenuView()
                        .transition(.move(edge: .leading))
                        .offset(x: showMenu ? 0 : -250)
                        .gesture(
                            DragGesture()
                                .onEnded { gesture in
                                    if gesture.translation.width < -100 {
                                        withAnimation{
                                            showMenu = false
                                        }
                                    }
                                }
                        )
                        .zIndex(1)
                }
            }
        )
    }
}

struct ChatBubble: View {
    let message : String
    var body: some View {
        HStack {
            Text(message)
                .padding()
                .background(Color.blue)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

#Preview {
    ChatView()
}

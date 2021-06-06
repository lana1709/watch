//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by user on 06.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State var email = "1"
    @State var password = "1"
    @StateObject var userObject = UserObject()
    @State var showAlert = false
    @State var alertMessage = ""
   @State var toMainView = false
   // @ObservedObject var userObject = UserObject()
    var body: some View {
        VStack {
           Image("flatline")
            .resizable()
            .frame(width: 30, height: 30, alignment: .center)
            .padding()
            Text("EMAIL")
                .frame(width: 120, height: nil, alignment: .leading)
                .padding(.leading, 10)
            HStack {
                Image(systemName: "envelope")
                    .font(.title2)
                    .padding(.leading)
                TextField("name@email.com", text: $email)
                  //  .autocapitalization(.none)
                  //  .disableAutocorrection(true)
            }
            .frame(width: 200, height: 30, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            Text("PASSWORD")
                .frame(width: 120, height: nil, alignment: .leading)
                .padding(.top, 5)
                .padding(.leading, 10)
            HStack {
                Image(systemName: "lock")
                    .font(.title2)
                    .padding(.leading)
                SecureField("***********", text: $password)
            }
            .frame(width: 200, height: 30, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            
            Button(action: {
                userObject.login(email: email, password: password){
                    message in
                    if  message == "Success" {
                        
                        toMainView.toggle()
                    } else {
                                
                           
                        alertMessage = message
                        showAlert = true
                    }                }
            }, label: {
                Text("Войти")
                    .foregroundColor(.white)
                    .frame(width: 120, height: 20, alignment: .center)
                    .background(Color("AccentColor"))
                    .cornerRadius(50)
            }).padding(.top)
            NavigationLink(
                destination: MainView(),
                isActive: $toMainView,
                label: {
                    Text("")
                }).hidden()
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        })
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


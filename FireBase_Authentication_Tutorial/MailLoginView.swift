//
//  MailLoginView.swift
//  FireBase_Authentication_Tutorial
//
//  Created by YOUNGSIC KIM on 2020-01-27.
//  Copyright © 2020 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI
import Firebase

struct MailLoginView: View {
    @State private var emailString = ""
    @State private var password = ""
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @State private var showLogin = false
    
    var body: some View {
        VStack() {
            if showLogin {
                TextField("Email", text: $emailString).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                
                Button(action: {
                    self.addUserToServer()
                }){
                    Text("Sign up now")
                }.padding()
                    .alert(isPresented: $showAlert) {
                        return Alert(title: Text(alertMessage))
                }
            }
            Button(action: {
                self.showLogin = !self.showLogin
            }){
                HStack {
                    Image(systemName: "envelope.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(" Sign  in ").font(.body).bold()
                }
            }.padding(10).background(Color.gray).foregroundColor(Color.white)
        }.animation(.spring())
    }
    
    func addUserToServer() {
        Auth.auth().createUser(withEmail: emailString, password: password) { authResult, error in
            
            if error != nil {
                self.alertMessage = error!.localizedDescription
            }else {
                self.alertMessage = "\(authResult!.user.email!) created"
                self.emailString = ""
                self.password = ""
            }
            self.showAlert = true
        }
    }
}

struct MailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        MailLoginView()
    }
}

//
//  ContentView.swift
//  TestProject
//
//  Created by Rawan on 25/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject var auth = AuthViewModel()
    var body: some View {
        NavigationStack{
            //welcome page
            VStack {
                Image("welcome")
                    .resizable()
                    .frame(width: 370,height: 370)
                //button that take user to the login screen
                NavigationLink(destination: LoginView(auth: auth)) {
                    Text("Log In")
                        .frame(width: 130)
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                //button that take user to the signup screen 
                NavigationLink(destination: SignupView(auth: auth)) {
                    Text("Sign Up")
                        .frame(width: 130)
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

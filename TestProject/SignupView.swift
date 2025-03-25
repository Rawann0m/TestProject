//
//  SignupView.swift
//  TestProject
//
//  Created by Rawan on 25/09/1446 AH.
//
import SwiftUI

struct SignupView: View {
    @ObservedObject var auth: AuthViewModel
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack{
            
            VStack{
                Image("lock")
                    .resizable()
                    .frame(width: 350,
                           height: 350)
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if let errorMessage = auth.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {auth.signUp(email: email, password: password)}) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                NavigationLink("You have an account? LogIn", destination: LoginView(auth: auth))
                    .padding()
            }.padding(.horizontal)
            
                .fullScreenCover(isPresented: $auth.isAuthenticated) {
                    HomeView(auth: auth)
                }
                .onAppear {
                    auth.clearError()
                }
        }
        
    }
}


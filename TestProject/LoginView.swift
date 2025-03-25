//
//  LoginView.swift
//  TestProject
//
//  Created by Rawan on 25/09/1446 AH.
//
import SwiftUI

struct LoginView: View {
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
                    Text("Login")
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
                    
                    Button(action: {auth.logIn(email: email, password: password)}) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    NavigationLink("You don't have an account? Sign Up", destination: SignupView(auth: auth))
                        .padding()
                }
                .padding(.horizontal)

                    .fullScreenCover(isPresented: $auth.isAuthenticated) {
                        HomeView(auth: auth)
                    }
                    .onAppear {
                        auth.clearError()
                    }
            
        }
    }
}


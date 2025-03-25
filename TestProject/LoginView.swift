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
                //log in page
                VStack{
                    Image("lock")
                        .resizable()
                        .frame(width: 350,
                               height: 350)
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    //email text field
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)
                    // password
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    //handling errors
                    if let errorMessage = auth.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    //button to call the log in function
                    Button(action: {auth.logIn(email: email, password: password)}) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    // navigation to sign up page in case the user doesnt have an account
                    NavigationLink("You don't have an account? Sign Up", destination: SignupView(auth: auth))
                        .padding()
                }
                .padding(.horizontal)
            // Presents HomeView as a full screen modal when the user is authenticated
                    .fullScreenCover(isPresented: $auth.isAuthenticated) {
                        HomeView(auth: auth)
                    }
            // clear out errors
                    .onAppear {
                        auth.clearError()
                    }
            
        }
    }
}


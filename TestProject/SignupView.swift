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
            // signup screen
            VStack{
                Image("lock")
                    .resizable()
                    .frame(width: 350,
                           height: 350)
                Text("Sign Up")
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
                //button to call the signup function
                Button(action: {auth.signUp(email: email, password: password)}) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                // navigation to log in page in case the user have an account
                NavigationLink("You have an account? LogIn", destination: LoginView(auth: auth))
                    .padding()
            }.padding(.horizontal)
            // Presents HomeView as a full screen modal when the user is authenticated
                .fullScreenCover(isPresented: $auth.isAuthenticated) {
                    HomeView(auth: auth)
                }
            //clear out the errors
                .onAppear {
                    auth.clearError()
                }
        }
        
    }
}


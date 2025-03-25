//
//  AuthViewModel.swift
//  TestProject
//
//  Created by Rawan on 25/09/1446 AH.
//
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    
    @Published var errorMessage: String?
    //if user logged in and left the app without logging out and they came back they will go to home page insted tp be asked to log in again
    init() {
            checkUserLoggedIn()
        }

    //check if user is logged in
    func checkUserLoggedIn(){
        if Auth.auth().currentUser != nil {
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }
    
    //log in
    func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.isAuthenticated = false
            } else {
                self.errorMessage = nil
                self.isAuthenticated = true
            }
        }
    }
    
    //log out
    func logOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.isAuthenticated = false
                self.errorMessage = nil
            }
        } catch {
            DispatchQueue.main.async {
                print("Error logging out: \(error.localizedDescription)")}
        }
    }
    
    //sign up
     func signUp(email: String, password: String) {
         Auth.auth().createUser(withEmail: email, password: password) { result, error in
             if let error = error {
                 self.errorMessage = error.localizedDescription
                 self.isAuthenticated = false
             } else {
                 self.errorMessage = nil
                 self.isAuthenticated = true
             }
         }
    }
    
    //clear errors
    func clearError() {
            DispatchQueue.main.async {
                self.errorMessage = nil
            }
        }

    
}

//
//  HomeView.swift
//  TestProject
//
//  Created by Rawan on 25/09/1446 AH.
//
import SwiftUI

struct HomeView: View {
    @ObservedObject var auth: AuthViewModel
    var body: some View {
        NavigationStack {
                VStack{
                    Image("home")
                        .resizable()
                        .frame(width: 350,height: 350)
                    Text("Welcome to my app")
                    
                    Button(action: auth.logOut) {
                                   Text("Log Out")
                            .frame(width: 130)
                                       .padding()
                                       .background(Color.blue.opacity(0.7))
                                       .foregroundColor(.white)
                                       .cornerRadius(10)
                               }
                }
                .navigationBarTitle("Home")
            }
    }
}


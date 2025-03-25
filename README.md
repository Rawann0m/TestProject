# SwiftUI Authentication App

## Overview

This is a simple authentication app built using SwiftUI. The app provides user authentication functionality, including login, signup, and logout features. It utilizes an AuthViewModel to manage authentication state and errors.

## Features

User login with email and password

User signup with email and password

Logout functionality

Error handling for authentication failures

Navigation between Login, Signup, and Home screens

## Screens

### 1. LoginView

Displays a login form with email and password fields.

Calls the logIn function from AuthViewModel.

Shows authentication error messages if login fails.

Navigates to SignupView if the user doesn't have an account.

Redirects authenticated users to HomeView.

### 2. SignupView

Displays a signup form with email and password fields.

Calls the signUp function from AuthViewModel.

Shows authentication error messages if signup fails.

Navigates to LoginView if the user already has an account.

Redirects authenticated users to HomeView.

### 3. HomeView

Displays a welcome message and an image.

Provides a "Log Out" button to sign out from the app.

## Dependencies

SwiftUI

Combine (for ObservableObject authentication handling)

## Usage

Clone the repository or copy the SwiftUI code into your project.

Implement AuthViewModel with authentication logic (Firebase).

Run the app on a simulator or a physical device.

Test login, signup, and logout functionalities.

## How Authentication Works

The LoginView and SignupView use an ObservedObject of AuthViewModel to handle user authentication.

When the user logs in or signs up, AuthViewModel updates isAuthenticated.

If isAuthenticated is true, a full-screen modal presents HomeView.

The user can log out by pressing the "Log Out" button in HomeView, which resets isAuthenticated.

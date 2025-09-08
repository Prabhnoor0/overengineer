//
//  AuthView.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var isSignedIn = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background7")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 25) {
                    Text("Welcome")
                        .font(.custom("MarkerFelt-Thin", size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#800000"))
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)

                    Text("Login or Sign Up to Continue")
                        .font(.custom("MarkerFelt-Thin", size: 20))
                        .foregroundColor(Color.gray)

                  
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(hex: "#FFE4E1"))
                        .cornerRadius(15)
                        .frame(width: 320)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                   
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(hex: "#FFE4E1"))
                        .cornerRadius(15)
                        .frame(width: 320)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                   
                    Button(action: {
                        login()
                    }) {
                        Text("Login")
                            .font(.custom("MarkerFelt-Thin", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 60)
                            .background(Color(hex: "#FF6F61"))
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .disabled(isLoading)

                 
                    Button(action: {
                        signUp()
                    }) {
                        Text("Sign Up")
                            .font(.custom("MarkerFelt-Thin", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 60)
                            .background(Color(hex: "#D2691E"))
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .disabled(isLoading)

                  
                    Button(action: {
                        signInWithGoogle()
                    }) {
                        HStack {
                            Image(systemName: "globe")
                                .font(.title2)
                            Text("Continue with Google")
                                .font(.custom("MarkerFelt-Thin", size: 22))
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .frame(width: 280, height: 60)
                        .background(Color(hex: "#FF8C69"))
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .disabled(isLoading)

                    if isLoading {
                        ProgressView("Processing...")
                            .padding()
                            .foregroundColor(Color(hex: "#800000"))
                    }

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, 80)
            }
           
            .navigationDestination(isPresented: $isSignedIn) {
                GameChoice()
            }
        }
    }

    // MARK: - Firebase Email Login
    private func login() {
        isLoading = true
        errorMessage = nil
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isSignedIn = true
            }
        }
    }

    // MARK: - Firebase Email Sign Up
    private func signUp() {
        isLoading = true
        errorMessage = nil
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isSignedIn = true
            }
        }
    }

    // MARK: - Google Sign In
    private func signInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }

        isLoading = true
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                self.errorMessage = "Failed to get Google user."
                self.isLoading = false
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { _, error in
                self.isLoading = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.isSignedIn = true
                }
            }
        }
    }
}

#Preview {
    AuthView()
}


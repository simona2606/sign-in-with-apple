//
//  SignInButtonView.swift
//  SignInWithApple
//
//  Created by Simona Ettari on 14/12/22.
//

import SwiftUI
import AuthenticationServices
import FMProKit

struct SignInButtonView: View {
    
    @EnvironmentObject var api: FMODataAPI
    
    @ObservedObject var userViewModel = UserViewModel()
    @ObservedObject var userSettings: UserSettings
    
    @Binding var userId: String
    @Binding var email: String
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var flag: Bool
    
    var body: some View {
        
        ///Creates a Sign in with Apple button.
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.email, .fullName]
        } onCompletion: { result in
            
            Task {
                switch result {
                case .success(let auth):
                    
                    ///Here we can save the data we need through registration with apple
                    switch auth.credential {
                        
                    case let credential as ASAuthorizationAppleIDCredential:
                        userId = credential.user
                        email = credential.email ?? ""
                        firstName = credential.fullName?.givenName ?? ""
                        lastName = credential.fullName?.familyName ?? ""
                        
                        print("email \(email)")
                        
                        let usrDef = UserDefaults.standard
                        usrDef.set(email, forKey: "email")
                        userSettings.id = email
                        
                    
                        if (userViewModel.users.isEmpty) {
                            
                            userViewModel.user = User(id: userId, email: email, firstName: firstName, lastName: lastName)
                            
                            userViewModel.users.append(userViewModel.user)
                            
                            try await api.createRecord("User", userViewModel.user)
                            userSettings.id = email
                            print("Email after create: \(userSettings.id)")
                            flag.toggle()
                          
                        } else {
                            userViewModel.users = try! await api.getTable("User", "id", "('\(userViewModel.user.id)')", .equal)
                            if (!userViewModel.users.isEmpty) {
                                userSettings.id = email
                                userViewModel.user = userViewModel.users.first!
                            }
                        }
                        
                    default:
                        break
                    }
                    
                case .failure(let error):
                    print(error)
                    
                }
            }
        }.cornerRadius(15)
        
    }
}


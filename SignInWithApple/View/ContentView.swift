//
//  ContentView.swift
//  SignInWithApple
//
//  Created by Simona Ettari on 14/12/22.
//

import SwiftUI
import FMProKit
import AuthenticationServices

struct ContentView: View {
    
    @EnvironmentObject var api: FMODataAPI
    
    @Environment(\.colorScheme) var colorScheme

    @State var userId: String = ""
    @State var email: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    @State var flag = false
    
    @ObservedObject var userViewModel = UserViewModel()
    @ObservedObject var userSettings: UserSettings
    
    private var isSignedIn: Bool {
        !email.isEmpty
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                    if !isSignedIn {
                        SignInButtonView(userSettings: userSettings, userId: $userId, email: $email, firstName: $firstName, lastName: $lastName, flag: $flag)
                            .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
                            .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.height * 0.08)
                            .padding()
                            
                    } else {
                        NavigationLink(destination: WelcomeView(userViewModel: userViewModel, userSettings: userSettings), isActive: $flag) {
                            Button(action: {
                    
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.accentColor)
                                        .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.width * 0.3, alignment: .center)
                                    Text("Login")
                                        .font(.system(size: 22))
                                        .foregroundColor(.white)
                                }
                            })
                            
                        }
                    }
                    
            }.onAppear {
                Task {
                    userViewModel.users = try! await api.getTable("User", "id", "('\(userViewModel.user.id)')", .equal)
                    
                    print("userrr: \(userViewModel.users)")
                    print("userrr: \(userViewModel.user)")
                    
                }
            }
            .padding()
        }
        
    }
    
}


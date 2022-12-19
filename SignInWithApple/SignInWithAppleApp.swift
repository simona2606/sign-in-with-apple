//
//  SignInWithAppleApp.swift
//  SignInWithApple
//
//  Created by Simona Ettari on 14/12/22.
//

import SwiftUI
import FMProKit

@main

struct SignInWithAppleApp: App {
    @StateObject var api = FMODataAPI("napoli.fm-testing.com", "HanabiTestDB", "Admin", "harrypotter")
    @ObservedObject var userSettings = UserSettings()
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
        if userSettings.id == "" {
            ContentView(userSettings: userSettings)
                    .environmentObject(api)

            } else {
                WelcomeView(userViewModel: userViewModel, userSettings: userSettings)

            }
            
        }
    }
}

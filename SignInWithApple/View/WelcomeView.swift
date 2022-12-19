//
//  WelcomeView.swift
//  SignInWithApple
//
//  Created by Simona Ettari on 15/12/22.
//

import SwiftUI
import FMProKit

struct WelcomeView: View {
    @EnvironmentObject var api: FMODataAPI
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var userSettings: UserSettings
    
    var body: some View {
        HStack {
            Text("Welcome")
            Text(userSettings.id)
        }.navigationBarBackButtonHidden(true)
            
    }
}


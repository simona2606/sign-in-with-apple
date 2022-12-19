//
//  UserViewModel.swift
//  SignInWithApple
//
//  Created by Simona Ettari on 14/12/22.
//

import Foundation
import SwiftUI
import FMProKit

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var user: User = User()
    
}

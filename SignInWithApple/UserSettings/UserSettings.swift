//
//  UserSettings.swift
//  SignInWithApple
//
//  Created by Simona Ettari on 14/12/22.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    
    /// All iOS apps have a built in data dictionary that stores small amounts of user settings for as long as the app is installed. This system is called UserDefaults.
    /// Here we set a value to be saved via the UserDefault
    
    @Published var id: String
    {
        didSet {
            UserDefaults.standard.set(id, forKey: "id")
        }
    }
    
    init() {
        self.id = UserDefaults.standard.object(forKey: "id") as? String ?? ""
    }
}

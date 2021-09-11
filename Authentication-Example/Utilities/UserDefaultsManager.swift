//
//  UserDefaultsManager.swift
//  Authentication-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation

struct UserDefaultsManager {
    
    //MARK: - singleton manager
    static var shared = UserDefaultsManager()
    private init() {}
    let def = UserDefaults.standard
    
    //MARK: - computed properties
    
    // computed propery to check if the user SignedIn or not
    var isSignedIn: Bool {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.isSignedIn)
        } get {
            guard def.object(forKey: UserDefaultsKeys.isSignedIn) != nil else {
                return false
            }
            return def.bool(forKey: UserDefaultsKeys.isSignedIn)
        }
    }
    
    // computed propery for token
    var token: String {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.token)
        } get {
            guard def.object(forKey: UserDefaultsKeys.token) != nil else {
                return "token not existing"
            }
            return def.object(forKey: UserDefaultsKeys.token) as! String
        }
    }
    
    // computed propery for userEmail
    var userEmail: String {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.userEmail)
        } get {
            guard def.object(forKey: UserDefaultsKeys.userEmail) != nil else {
                return "userEmail not existing"
            }
            return def.object(forKey: UserDefaultsKeys.userEmail) as! String
        }
    }
    
    // computed propery for password
    var password: String {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.password)
        } get {
            guard def.object(forKey: UserDefaultsKeys.password) != nil else {
                return "password not existing"
            }
            return def.object(forKey: UserDefaultsKeys.password) as! String
        }
    }

}

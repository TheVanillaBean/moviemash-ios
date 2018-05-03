//
//  AuthService.swift
//  MovieMash
//
//  Created by Alex on 5/3/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    fileprivate static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider" : user.providerID, "email": user.email]
            FBDataService.instance.createUser(withID: user.uid, userData: userData)
            userCreationComplete(true, nil)
            
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard user != nil else {
                loginComplete(false, error)
                return
            }
            
            loginComplete(true, nil)
        }
    }
    
}

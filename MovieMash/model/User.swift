//
//  User.swift
//  MovieMash
//
//  Created by Alex on 5/3/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation

class User {
    
    fileprivate var _uuid: String!
    fileprivate var _email: String!
    
    var uuid: String {
        get{
            return _uuid
        }
        
        set(newUUID){
            
            if newUUID != ""{
                _uuid = newUUID
            }
        }
    }
    
    var email: String {
        get{
            return _email
        }
        
        set(newEmail){
            
            if newEmail != ""{
                _email = newEmail
            }
        }
    }
    
    init(email: String?){
        
        if let userEmail = email {
            self.email = userEmail
        }
        
    }
    
    init(){
        
    }
    
}

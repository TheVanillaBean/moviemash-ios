//
//  ViewController.swift
//  MovieMash
//
//  Created by Alex on 4/28/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginVC: UIViewController {
        
    @IBOutlet weak var emailField: HoshiTextField!
    @IBOutlet weak var passwordField: HoshiTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
    }

    @IBAction func signInBtnPressed(_ sender: Any) {
        
        if let email = emailField.text, let password = passwordField.text {
            AuthService.instance.loginUser(withEmail: email, andPassword: password, loginComplete: { (success, error) in
                
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else{
                    print(String(describing: error?.localizedDescription))
                    
                    AuthService.instance.registerUser(withEmail: email, andPassword: password, userCreationComplete: { (success, error) in
                        if success {
                            AuthService.instance.loginUser(withEmail: email, andPassword: password, loginComplete: { (success, nil) in
                                self.dismiss(animated: true, completion: nil)
                            })
                        } else {
                            print(String(describing: error?.localizedDescription))
                        }
                    })
                    
                }
                
                
                
            })
        }
        
    }
    
}



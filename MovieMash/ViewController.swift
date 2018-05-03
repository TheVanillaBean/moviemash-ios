//
//  ViewController.swift
//  MovieMash
//
//  Created by Alex on 4/28/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

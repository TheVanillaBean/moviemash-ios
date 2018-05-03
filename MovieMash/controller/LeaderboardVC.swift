//
//  LeaderboardVC.swift
//  MovieMash
//
//  Created by Alex on 5/3/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit
import Firebase

class LeaderboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let GameVC = segue.destination as? GameViewController {
//            
//        }
    }
    
    @IBAction func plusBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "NewGame", sender: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as? LoginVC
            self.present(loginVC!, animated: true, completion: nil)
        } catch {
            print(error)
        }
    }
}

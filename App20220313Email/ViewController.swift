//
//  ViewController.swift
//  App20220313Email
//
//  Created by grace on 2022/3/13.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                print("登入id\(user.uid)")
            } else {
                print("尚未登入")
            }
        }
    }

    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("登出成功")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}


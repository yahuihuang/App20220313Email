//
//  ViewController.swift
//  App20220313Email
//
//  Created by grace on 2022/3/13.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var statusText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusText.text = ""
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                print("登入id\(user.uid)")
                
                self.statusText.text = self.statusText.text +
                    "登入id: \(user.uid)\n" +
                    "登入email: \(user.email ?? "")\n" +
                    "檢查郵件狀態: \(user.isEmailVerified)\n"
            } else {
                print("尚未登入")
                self.statusText.text = self.statusText.text + "已登出\n"
            }
        }
    }

    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("登出成功")
            self.statusText.text = self.statusText.text + "登出成功\n"
        } catch {
            print(error.localizedDescription)
        }
    }
    
}


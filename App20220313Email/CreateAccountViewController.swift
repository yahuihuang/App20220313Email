//
//  CreateAccountViewController.swift
//  App20220313Email
//
//  Created by grace on 2022/3/13.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var MyAccount: UITextField!
    @IBOutlet weak var MyPassword: UITextField!
    @IBOutlet weak var MyPassword2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createAccount(_ sender: Any) {
        let theAccount = MyAccount.text ?? ""
        let pwd1 = MyPassword.text ?? ""
        let pwd2 = MyPassword2.text ?? ""
        
        if validateEmail(theAccount) == false{
            print("Email 格式不對")
            showMessage("Email 格式不對")
            return
        } else {
            print("格式對了")
        }
        
        if pwd1.count < 6 {
            print("密碼至少要6碼")
            showMessage("密碼至少要6碼")
            return
        }
        
        if pwd1 != pwd2 {
            print("2次輸入的密碼需一致")
            showMessage("2次輸入的密碼需一致")
            return
        }
        
        Auth.auth().createUser(withEmail: theAccount, password: pwd1) { result, error in
            if let error = error {
                print("登入失敗: \(error.localizedDescription)")
                self.showMessage("error: \(error.localizedDescription)")
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    //檢查 Email 格式
    func validateEmail(_ candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
}

extension UIViewController {
    func showMessage(_ msg: String) {
        let alert = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我收到了", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

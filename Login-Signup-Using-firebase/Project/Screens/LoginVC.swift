//
//  LoginVC.swift
//  Project
//
//  Created by Azka  on 15/01/2024.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func Login(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        // Instantiate SignUpVC from the XIB
            let signUpVC = SignUpVC(nibName: "SignUpVC", bundle: nil) // Change "SignUpVC" to the name of your XIB file
            
            // Push SignUpVC onto the navigation stack
            self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    func validateFields(){
        if Email.text?.isEmpty == true {
            printContent("No text in email field")
            return
        }
        if Password.text?.isEmpty == true {
            printContent("No text in password field")
            return
        }
        login()
    }
    func login() {
        Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) { [weak self] authResult, err in guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self?.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
            let signUpVC = SignUpVC(nibName: "SignUpVC", bundle: nil) // Change "SignUpVC" to the name of your XIB file
                
                // Push SignUpVC onto the navigation stack
                self.navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
}

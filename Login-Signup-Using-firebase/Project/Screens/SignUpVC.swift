//
//  SignUpVC.swift
//  Project
//
//  Created by Azka  on 15/01/2024.
//
import Firebase
import UIKit
import FirebaseCore
import FirebaseAuth



class SignUpVC: UIViewController {

    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func SignUpTapped(_ sender: Any) {
        if Email.text?.isEmpty == true {
            printContent("No text in email field")
            return
        }
        if Password.text?.isEmpty == true {
            printContent("No text in password field")
            return
        }
        signUP()
    }
    
    @IBAction func AlreadyhaveanaccountTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func signUP() {
        Auth.auth().createUser(withEmail: Email.text!, password: Password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription ?? "")")
                return
            }
            // Instantiate SignUpVC from the XIB
                let WelcomeVC = SignUpVC(nibName: "WelcomeVC", bundle: nil) // Change "SignUpVC" to the name of your XIB file
                
                // Push SignUpVC onto the navigation stack
                self.navigationController?.pushViewController(WelcomeVC, animated: true)
        }
    }
    
}

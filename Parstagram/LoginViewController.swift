//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Anthony Owyeong on 3/6/19.
//  Copyright © 2019 Anthony Owyeong. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    @IBAction func onCancelPressed(_ sender: Any) {
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
    }
    
   
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("error: \(error?.localizedDescription)")
            }
            
        }
    }
    

}

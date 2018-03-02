//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by Brian Kiptoo on 01/03/2018.
//  Copyright © 2018 Brian Kiptoo. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil{
            self.presentLoggeInScreen()
        }
    }
    @IBAction func createAccountTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
          Auth.auth().createUser(withEmail: email, password: password, completion: {(user,error) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let firebaseError = error{
                print(firebaseError.localizedDescription)
                return
            }
            self.presentLoggeInScreen()
            
          })
        }
    }
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
                self.presentLoggeInScreen()
            })
        }
    }
    
    func presentLoggeInScreen(){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController:loggedInViewController = storyboard.instantiateViewController(withIdentifier: "loggedInViewController") as! loggedInViewController
        self.present(loggedInViewController, animated: true, completion: nil)
    }
}


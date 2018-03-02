//
//  loggedInViewController.swift
//  FirebaseLogin
//
//  Created by Brian Kiptoo on 02/03/2018.
//  Copyright © 2018 Brian Kiptoo. All rights reserved.
//

import UIKit
import FirebaseAuth

class loggedInViewController: UIViewController {
    
    @IBAction func logOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        }catch{
           print("there was a problem logging out")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

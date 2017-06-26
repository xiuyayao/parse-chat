//
//  SignUpViewController.swift
//  ParseChat
//
//  Created by Xiuya Yao on 6/26/17.
//  Copyright © 2017 Xiuya Yao. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    let signUpAlertController = UIAlertController(title: "Invalid Input", message: "Please enter username AND password", preferredStyle: .alert)
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBAction func registerUser(_ sender: UIButton) {
        if emailLabel.text!.isEmpty || usernameLabel.text!.isEmpty || passwordLabel.text!.isEmpty {
            self.present(self.signUpAlertController, animated: true)
        }
        
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameLabel.text
        newUser.email = emailLabel.text
        newUser.password = passwordLabel.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                // dismiss modal view
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        signUpAlertController.addAction(OKAction)
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

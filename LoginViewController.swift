//
//  LoginViewController.swift
//  LoginProject
//
//  Created by Matt Linaberry on 4/5/15.
//  Copyright (c) 2015 Matt Linaberry. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,CreateAccountViewControllerDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        // lets access stuff from NSUserDefaults
        let userNameSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(userNameKey) as String
        println(userNameSavedFromNSUserDefaults)
        let passwordSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(passwordKey) as String
        println(passwordSavedFromNSUserDefaults)
        
        // does the text property match this?
        if usernameTextField.text == userNameSavedFromNSUserDefaults && passwordTextField.text == passwordSavedFromNSUserDefaults {
            self.performSegueWithIdentifier("loginToMainSegue", sender: self)
        }
    }

    @IBAction func createAccountButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("loginToCreateAccountSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginToCreateAccountSegue" {
            var createAccountVC = segue.destinationViewController as CreateAccountViewController
            createAccountVC.delegate = self
        }
    }
    
    //CreateAccountViewControllerDelegate
    func accountCreated() {
        self.performSegueWithIdentifier("loginToMainSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

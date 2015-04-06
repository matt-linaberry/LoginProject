//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Matt Linaberry on 4/5/15.
//  Copyright (c) 2015 Matt Linaberry. All rights reserved.
//

import UIKit
// create a protocol - like an interface in java

protocol CreateAccountViewControllerDelegate {
    func accountCreated()
}
class CreateAccountViewController: UIViewController {

    @IBOutlet weak var chooseUserNameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate:CreateAccountViewControllerDelegate?
    
    let userNameKey = "userNameKey"
    let passwordKey = "passwordKey"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        if (choosePasswordTextField.text == confirmPasswordTextField.text && choosePasswordTextField.text != nil) {
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUserNameTextField.text, forKey: userNameKey)
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: passwordKey)
            
            // now save them
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            delegate?.accountCreated()

        }
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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

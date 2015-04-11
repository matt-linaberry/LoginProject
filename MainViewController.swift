//
//  MainViewController.swift
//  LoginProject
//
//  Created by Matt Linaberry on 4/5/15.
//  Copyright (c) 2015 Matt Linaberry. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userNameLabel.text = NSUserDefaults().objectForKey(userNameKey) as? String // there might not be anything there!!
        passwordTextField.text = NSUserDefaults().objectForKey(passwordKey) as? String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

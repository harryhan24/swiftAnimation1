//
//  LoginViewController.swift
//  Login
//
//  Created by Sandy L on 2016-03-06.
//  Copyright © 2016 Sandy L. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {

        super.viewDidLoad()
        
        emailField.center.x -= view.bounds.width
        passwordField.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9,
                initialSpringVelocity: 0.5, options: [.CurveEaseOut], animations: {
                self.emailField.center.x += self.view.bounds.width
        }, completion:nil)
            
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.9,
                    initialSpringVelocity: 0.5, options: [.CurveEaseOut], animations: {
                self.passwordField.center.x += self.view.bounds.width
        }, completion:nil)
    
    }
    

}

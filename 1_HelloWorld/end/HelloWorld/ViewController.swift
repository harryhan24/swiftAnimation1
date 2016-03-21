//
//  ViewController.swift
//  HelloWorld-Bounce
//
//  Created by Sandy L on 2016-03-07.
//  Copyright © 2016 Sandy L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloWorld: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var hiddenLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        helloWorld.center.y -= view.bounds.height
        secondLabel.center.y += view.bounds.height
        hiddenLabel.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //animate Hello World label
        UIView.animateWithDuration(1.0, animations: {
            self.helloWorld.center.y += self.view.bounds.height
            }, completion: { finished in
                
            self.secondAnimation()
        })
        
         //animate background color change
        UIView.animateWithDuration(2.0, delay: 0.5, options: [], animations: {
            
            self.view.backgroundColor = UIColor.yellowColor()
            
            }, completion:{ finished in
                
                self.backgroundColor()
        
        })
    }
    
    func secondAnimation() {
        
        //animate second label
        UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: {
            self.secondLabel.center.y -= self.view.bounds.height
            
            }, completion:nil)
    }
    
    
    func backgroundColor() {
        
        UIView.animateWithDuration(2.5, animations: {
            self.view.backgroundColor = UIColor.blackColor()

            }, completion:nil)
        
        UIView.animateWithDuration(1.0, delay: 1.5, options: [], animations: {
              self.hiddenLabel.alpha = 1.0
            
            }, completion:nil)
    }
    
 
   
}


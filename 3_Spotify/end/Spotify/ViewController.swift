//
//  ViewController.swift
//  Login
//
//  Created by Sandy L on 2016-03-06.
//  Copyright © 2016 Sandy L. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var message: UILabel!
    
    var messages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make the navigation bar transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        //make the back button and other bar button items white
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        messages = ["Music for everyone", "millions of songs on Spotify. Play your favorites, discover new tracks, and build the perfect collection", "Find readymade playlists to match your mood, put together by music fans and experts", " Hear this week’s latest singles and albums, and check out what’s hot in the Top 50"]
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        backgroundImage.alpha = 0.0
        continueButton.alpha = 0.0
        message.alpha = 0.0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1, delay: 0.0, options: [], animations: {
            self.backgroundImage.alpha = 1.0
            }, completion:nil)
        
        
        UIView.animateWithDuration(2.0, delay: 0.5,
            usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0,
            options: [], animations: {
                
                self.continueButton.alpha = 1.0
                
                self.continueButton.center.y -= 30.0
                
                
            }, completion: { _ in
                
                self.marketingMessages(0)
                
        })
        
    }
    
    
    func marketingMessages(var index: Int) {
        
        let message = self.messages[index]
        self.message.text = message
        self.message.center.y += 30.0
        
        UIView.animateKeyframesWithDuration(10.0, delay: 0.0, options: [], animations: {
            
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.10, animations: {
                self.message.alpha = 0.5
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.10, relativeDuration: 0.05, animations: {
                self.keyframeAnimation()
            })
            
    
            UIView.addKeyframeWithRelativeStartTime(0.90, relativeDuration: 0.05, animations: {
                self.message.alpha = 0.0
                
            })
            
            
            }, completion: { _ in
                
                //making sure the index not out of bounds
                if index == self.messages.count-1 {
                    index = 0
                } else {
                    index++
                }
                
                //switching to next message after index incremented
                self.marketingMessages(index)
                
        })
        
    }
    
    func keyframeAnimation() {
        
        UIView.animateWithDuration(1.0, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0,  options: [.CurveEaseOut],  animations: {
            
            self.message.center.y -= 30.0
        
        }, completion: nil)
        
    }
}


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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        //make the back button and other bar button items white
        self.navigationController!.navigationBar.tintColor = UIColor.white
        
        messages = ["Music for everyone", "millions of songs on Spotify. Play your favorites, discover new tracks, and build the perfect collection", "Find readymade playlists to match your mood, put together by music fans and experts", " Hear this week’s latest singles and albums, and check out what’s hot in the Top 50"]
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        backgroundImage.alpha = 0.0
        continueButton.alpha = 0.0
        message.alpha = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0.0, options: [], animations: {
            
            //display background image
            self.backgroundImage.alpha = 1.0

            }, completion:nil)
        
        
    
        UIView.animate(withDuration: 2.0, delay:0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0,options:[], animations: {
            
            
            
            
                //display button
            self.continueButton.alpha = 1.0
            self.continueButton.center.y -= 30
            
        }, completion:{ _ in
            
            self.marketingMessages(0)
        })
        
    }
    
    
    func marketingMessages(_ index: Int) {
        var index = index
        
        let message = self.messages[index]
        self.message.text = message
        
        //to reposition label 
        self.message.center.y += 30.0
        
        //애니메이션을 계속 실행시킨다.
        UIView.animateKeyframes(withDuration: 10.0, delay: 0.0, options: [], animations: {
            
            
            //라벨을 보이게한 후
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.10, animations: {
                self.message.alpha = 0.5
            })
        
            
            //애니메이션을 Bountce를 준 후 사라지게함
            UIView.addKeyframe(withRelativeStartTime: 0.90, relativeDuration: 0.05, animations: {
                self.keyframeAnimation()
            })
            
            
        }, completion: {_ in
            
            //다시 콜백함수로 해당 텍스트를 교체해준다.
            if index == self.messages.count-1{
                
                index = 0
                
            }else{
                index += 1
            }
            
            self.marketingMessages(index)
        })
        
    }
    
    func keyframeAnimation() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0,  options: [.curveEaseOut],  animations: {
            
            self.message.center.y -= 30.0
            
        }, completion: nil)
        
    }
}


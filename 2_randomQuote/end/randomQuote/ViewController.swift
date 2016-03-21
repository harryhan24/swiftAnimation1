//
//  ViewController.swift
//  randomQuote
//
//  Created by Sandy L on 2016-03-08.
//  Copyright © 2016 Sandy L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteLabel.alpha = 0.0
        authorLabel.alpha = 0.0
        
        self.view.backgroundColor = getRandomColor()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func randomQuotePressed(sender: UIButton) {
          setQuote()
    }

    
    func setQuote() {
        
        self.fadeOut()
        
        let dataService = DataService()
        dataService.getQuoteData {(quote, author) -> Void in
            
            UIView.animateWithDuration(0.5, animations: {
                
                self.fadeIn()
                
                self.view.backgroundColor = self.getRandomColor()
                
                self.quoteLabel.text = "\" \(quote)\" "
        
                
                if let aAuthor = author {
                    self.authorLabel.text = "- \(aAuthor)"
                }
                
                //if no author
                if author == "" {
                    self.authorLabel.text = "- unknown"
                }
                
            }, completion:nil)
            
            
        }
    }
    
    func fadeIn() {
        self.quoteLabel.alpha = 1.0
        self.authorLabel.alpha = 1.0
    }
    
    
    func fadeOut() {
        self.quoteLabel.alpha = 0.0
        self.authorLabel.alpha = 0.0
    }
    
    func getRandomColor() -> UIColor {
        let randomRed:CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))
        let randomGreen:CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))
        let randomBlue:CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))
        
        return UIColor(red: randomRed/255.0, green: randomGreen/255.0, blue: randomBlue/255.0, alpha: 0.8)
    }
    
}


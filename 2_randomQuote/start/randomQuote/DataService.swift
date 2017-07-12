//
//  DataService.swift
//  randomQuote
//
//  Created by Sandy L on 2016-03-08.
//  Copyright © 2016 Sandy L. All rights reserved.
//


import Foundation
import UIKit


class DataService {
    
    //완료 후 콜백을 실행
    func getQuoteData(_ completion: @escaping (_ quote: String, _ author: String?) -> ()) {
        
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        
        
        //데이터를 가져옴
        URLSession.shared.dataTask(with: url, completionHandler: { ( data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            //성공적으로 받아올경우
            do {
                
                //데이터를 JSON 저장할 변수를 선언하여 가져온 데이터를 넣어줌
                let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                //각 변수에 선언
                 let aQuote = jsonDictionary["quoteText"] as! String
                 let aAuthor = jsonDictionary["quoteAuthor"] as! String
            
                //콜백을 실행
                DispatchQueue.main.async(execute: { () -> Void in
                    //요기서 인자를 넘김
                    completion(aQuote, aAuthor)
                })
                                
            } catch {
                print("invalid json query")
            }
        } as! (Data?, URLResponse?, Error?) -> Void).resume() //다음 큐를 실행
    }
}

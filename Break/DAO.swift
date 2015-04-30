//
//  DAO.swift
//  Break
//
//  Created by Hugo Machado on 3/24/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DAO {
    

    func loadBreak(place:String, time:String, people:String) -> Break {
        
        var plistPath:String = NSBundle.mainBundle().pathForResource("lista", ofType: ".plist")!
        let plistDictionary:NSDictionary = NSDictionary(contentsOfFile: plistPath)!
        let placeDictionary:NSDictionary = plistDictionary[place] as! NSDictionary
        let timeDictionary:NSDictionary = placeDictionary[time] as! NSDictionary
        let breakArray:NSArray = timeDictionary[people] as! NSArray
        
        
        var num = Int()
            num = Int(arc4random_uniform(UInt32(breakArray.count)))
    
       
        
        let selectedBreak:NSDictionary = breakArray[num] as! NSDictionary

        var img = selectedBreak.objectForKey("img") as! String
        var dsc = selectedBreak.objectForKey("descricao") as! String
        var tipo:Int? = (selectedBreak.objectForKey("tipo") as! NSNumber?) as Int?
        var titulo = selectedBreak.objectForKey("title") as! String
        
        var imagem: UIImage? = UIImage(named: img)
        
        var url = NSURL(string: img)
        var req = NSURLRequest(URL: url!)
        var vid: WKWebView! = WKWebView()
        
        
        var type: BreakType! = BreakType.image
        
        if tipo == 1{
            if imagem == nil {
                imagem = UIImage(named: "blank.png")!
            }            
            type = BreakType.image
        }
        else{
        println(img)
            vid.loadRequest(req)
        
            
            if vid == nil {
                var url2 = NSURL(string: "")
                var req2 = NSURLRequest(URL: url2!)
                vid.loadRequest(req2)
            }
            type = BreakType.video
        }
        
        
        var result:Break! = Break(image:imagem, description:dsc, type:type, title:titulo, video:vid)
        
        
        return result
    }

}

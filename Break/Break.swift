//
//  Break.swift
//  Break
//
//  Created by Beatriz Melo Mousinho Magalhães on 3/16/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit
import WebKit

class Break {
    
        
   
    var img: UIImage!
    var dsc: String!
    var vid: WKWebView!
    var type:BreakType!
    var title: String!
    
    
    init (image:UIImage!, description:String!, type:BreakType!, title:String!, video:WKWebView!){
        
        self.img = image
        self.dsc = description
        self.type = type
        self.title = title
        self.vid = video
    
    }
    
        
  
    
}

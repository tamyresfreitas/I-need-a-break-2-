//
//  SystemStatus.swift
//  Break
//
//  Created by Hugo Machado on 3/24/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import Foundation
import UIKit

class SystemStatus: NSObject {

    var placeString:String! = ""
    var timeString:String! = ""
    var optionString:String! = ""
    
    class var sharedInstance :SystemStatus {
        
        get{
            struct Singleton {
                static let instance = SystemStatus(secret: "Segredo")
            }
            return Singleton.instance
        }
    }
    
    override init(){
        NSException (name: "Singleton Failure", reason: "This is a singleton, if you want to access its instance use the property 'sharedInstance' ", userInfo: nil).raise()
    }
    
    private init(secret: String){
        super.init()
    }

    
}

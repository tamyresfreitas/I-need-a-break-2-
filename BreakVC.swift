//
//  BreakVC.swift
//  Break
//
//  Created by Stefano Politi on 16/03/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit
import WebKit


class BreakVC: UIViewController {

    
    @IBOutlet var homeView: UIView!
    @IBOutlet var buttonView: UIView!
    @IBOutlet var breakNovo: UIButton!
    @IBOutlet var waitingButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var containerView: UIView! = nil
    
    
    var webView: WKWebView?
  
    var brk: Break?
    var dao:DAO = DAO()
    var tapCount:Int!
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    
   
    
    override func loadView() {
        super.loadView()
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        if tapCount == nil{
            
            tapCount = 0
            
        }
        
        
        
        
        
        self.brk = dao.loadBreak(SystemStatus.sharedInstance.placeString, time: SystemStatus.sharedInstance.timeString, people: SystemStatus.sharedInstance.optionString)
        
        label.text? = self.brk!.dsc
        titleLabel.text = self.brk!.title
        
        
        if self.brk!.type == BreakType.image {
            var breakImageView:UIImageView = UIImageView(image: self.brk!.img)
            breakImageView.frame = CGRect(x:0, y:height/3.00, width:width, height: height/2)
            breakImageView.contentMode = .ScaleAspectFit
            view.addSubview(breakImageView)
            println("\(breakImageView.frame)")
            
            
        } else if self.brk!.type == BreakType.video {
            
            self.webView = self.brk?.vid
            self.webView?.frame = CGRect(x:0, y:height/2.8, width:width, height: height/2.5)
            self.view.addSubview(self.webView!)
        }
        
    }
    
    
    
   
    
    @IBAction func anotherBreak(sender: UIButton) {
        
        tapCount=tapCount+1
        println("numero \(tapCount)")
        if tapCount == 6 {
            
            buttonView.hidden = true;
            homeView.frame = CGRectMake(view.frame.width*0.5-homeView.frame.width*0.5, homeView.frame.origin.y, homeView.frame.size.width, homeView.frame.size.height);
            
            
            var alert = UIAlertController(title: "OPS!", message: "You only have 6 breaks, come back after 2 hours ", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }
        
        var breakView: BreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("BVC") as! BreakVC
        breakView.tapCount=tapCount
        self.presentViewController(breakView, animated: false, completion: nil)
        
    }
    
    @IBAction func animationButton(sender: AnyObject) {
        
        var animationView: AnimationVC = self.storyboard?.instantiateViewControllerWithIdentifier("AnimationVC") as! AnimationVC
        
        animationView.setView1(screenShotMethod(self.view))
        
        
        self.showViewController(animationView, sender: self)
        
        
        
    }
    
    func screenShotMethod(aux: UIView)->UIImage{
        //Create the UIImage
        var temp:UIImage! = UIImage()
        UIGraphicsBeginImageContextWithOptions(UIScreen.mainScreen().bounds.size, false, 0);
        aux.drawViewHierarchyInRect(aux.bounds, afterScreenUpdates: true)
        temp = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        println("Screenshot")
        
        return temp
        
    }


}







//
//  FromBreakVC.swift
//  Break
//
//  Created by Beatriz Melo Mousinho Magalhães on 3/15/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class FromBreakVC: UIViewController {
    
    //Views
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var lifeView: UIView!
    
    
    //Labels
    @IBOutlet weak var step1View: UIView!
    @IBOutlet weak var fromTitleView: UIView!

    
    //Screensize
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    
    @IBAction func homeAction(sender: AnyObject) {
        
        var timeView: TimeBreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("TB" ) as! TimeBreakVC

        SystemStatus.sharedInstance.placeString = "home"
        
        self.showViewController(timeView, sender: self)
        
        println("Place é " + SystemStatus.sharedInstance.placeString)

    }
    
      
    @IBAction func workAction(sender: AnyObject) {
        
        var timeView: TimeBreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("TB") as! TimeBreakVC
        
        SystemStatus.sharedInstance.placeString = "work"
        
        self.showViewController(timeView, sender: self)
        
        println("Place é " + SystemStatus.sharedInstance.placeString)
    }
    
    
    @IBAction func lifeAction(sender: AnyObject) {
        
        var timeView: TimeBreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("TB") as! TimeBreakVC
        
        SystemStatus.sharedInstance.placeString = "life"
     
        self.showViewController(timeView, sender: self)
        
        println("Place é " + SystemStatus.sharedInstance.placeString)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //  ANIMATING LABELS
        
        //  Step 1
        self.step1View.frame = CGRect(x: self.width*0.34, y:self.width*0.29, width:self.width*0.325, height:self.width*0.15)
        self.view.addSubview(step1View)
        UIView.animateWithDuration(0.7, delay:0.1, options:UIViewAnimationOptions.TransitionCrossDissolve, animations: {}, completion: { finished in
                println(" step 1 view animation")
        })
        
        
        //  I need a break FROM
        self.fromTitleView.frame = CGRect(x:self.width - self.width/1.25, y:self.width*0.40, width: self.width*0.65, height:self.width*0.15)
        self.view.addSubview(fromTitleView)
        UIView.animateWithDuration(0.7, delay:0.1, options: UIViewAnimationOptions.TransitionCrossDissolve , animations: {}, completion: { finished in
            println(" step 1 view animation")
        })
        println("\(self.width)")
        //320
        println("\(self.height)")
        //568

        
        
        //  ANIMATING BUTTONS
        
        //  home
        homeView.frame = CGRect(x: self.width, y: self.width*0.84, width:self.width*0.625, height:self.width*0.156)
        self.view.addSubview(homeView)
        UIView.animateWithDuration(0.7, delay:0.1, options: nil , animations: {
            
            self.homeView.backgroundColor = UIColor(red: 255, green: 173, blue: 115, alpha: 0.05)
            self.homeView.backgroundColor = UIColor.whiteColor()
            self.homeView.frame = CGRect(x:self.width*0.34, y:self.width*0.84, width:self.width*0.312, height: 50)
            
            }, completion: { finished in
                println(" home animation worked")
        })
        
        
        //  work
        workView.frame = CGRect(x: self.width, y:self.width*1.09, width:self.width*0.625, height:self.width*0.156)
        self.view.addSubview(workView)
        UIView.animateWithDuration(0.7, delay:0.05, options: nil, animations: {
            
            self.workView.backgroundColor = UIColor(red: 255, green: 173, blue: 115, alpha: 0.05)
            self.workView.backgroundColor = UIColor.whiteColor()
            self.workView.frame = CGRect(x:self.width*0.34, y:self.width*1.09 , width:self.width*0.312, height:self.width*0.156)
            
            }, completion: { finished in
                println(" work animation worked")
        })
        
        //  life
        lifeView.frame = CGRect(x:self.width, y:self.width*1.34, width:self.width*0.625, height:50)
        self.view.addSubview(lifeView)
        UIView.animateWithDuration(0.7, delay:0.025, options: nil, animations: {
            
            self.lifeView.backgroundColor = UIColor(red: 255, green: 173, blue: 115, alpha: 0.05)
            self.lifeView.backgroundColor = UIColor.whiteColor()
            self.lifeView.frame = CGRect(x:self.width*0.34, y:self.width*1.34, width:self.width*0.312, height:self.width*0.156)
            
            }, completion: { finished in
                println(" life animation worked")
        })


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //CUSTOMIZING NAVIGATION BAR
        
        let swiftColor = UIColor(red: 251/255, green: 169/255, blue: 111/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor

        let backButton = UIBarButtonItem(title: "< back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack:")
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)

        self.navigationController?.navigationBarHidden = false
        
        

    }
    
    func goBack(sender:UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationLoginScreenVC.
        // Pass the selected object to the new view controller.
    }
    */

}



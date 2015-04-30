//
//  TimeBreakVC.swift
//  Break
//
//  Created by Abdallah Assaad Seoud on 3/14/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class TimeBreakVC: UIViewController {
    
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var goView: UIView!
    
    var previousLocation = CGPoint()
    
    //Screensize
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height

    
    @IBAction func timeSliderChanged(sender: UISlider) {
        
        var currentValue = Int(sender.value)

        
        labelTime.text = "\(currentValue) minutes"
        var size:Float = 20+(sender.value)/1.2
        labelTime.font = labelTime.font.fontWithSize(CGFloat(size))
        //labelTime.sizeToFit()
        labelTime.textAlignment = .Center
        //size = -size
        //labelTime.frame.origin.x.advancedBy(CGFloat(size))
       // labelTime.layer.anchorPoint = labelTime.frame.x/2.
        
      

        

    }
    
       @IBAction func goButton(sender: AnyObject) {
        
        var peopleView: PeopleBreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("PeopleBreakVC") as! PeopleBreakVC
        
        var currentValue = Int(self.timeSlider.value)
        
        if currentValue <= 10 {
            SystemStatus.sharedInstance.timeString = "10"
            println("menor que 10")
        }
            
        else{
            SystemStatus.sharedInstance.timeString = "20"
            println("maior que 10")
        }
        
        self.showViewController(peopleView, sender: self)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        
        //  ANIMATING BUTTONS
        
        //  time slider
        timeSlider.frame = CGRect(x: self.width, y:339 , width:300, height:30)
        self.view.addSubview(timeSlider)
        UIView.animateWithDuration(0.7, delay:0.1, options: nil , animations: {
            
            self.timeSlider.frame = CGRect(x:77, y:339, width:168, height: 30)
            
            }, completion: { finished in
        })

        
        //  home
        goView.frame = CGRect(x: self.width, y: self.width*1.42, width:self.width*0.625, height:self.width*0.156)
        self.view.addSubview(goView)
        UIView.animateWithDuration(0.7, delay:0.05, options: nil , animations: {
            
            self.goView.backgroundColor = UIColor(red: 255, green: 173, blue: 115, alpha: 0.05)
            self.goView.backgroundColor = UIColor.whiteColor()
            self.goView.frame = CGRect(x:self.width*0.34, y:self.width*1.42, width:self.width*0.312, height: 50)
            
            }, completion: { finished in
        })

    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //CUSTOMIZING NAVIGATION BAR
        
        let swiftColor = UIColor(red: 1, green: 205/255, blue: 93/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor
        
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        let backButton = UIBarButtonItem(title: "< back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack:")
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)
    }
    func goBack(sender:UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

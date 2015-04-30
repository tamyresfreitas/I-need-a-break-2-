//
//  PeopleBreakVCVC.swift
//  Break
//
//  Created by Beatriz Melo Mousinho Magalhães on 3/15/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class PeopleBreakVC: UIViewController {
    
    @IBOutlet weak var yayView: UIView!
    @IBOutlet weak var nayView: UIView!
    
    //Screensize
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NAVIGATION BAR CUSTOMIZING
        let swiftColor = UIColor(red: 163/255, green: 240/255, blue: 153/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesAction(sender: AnyObject) {
        
        var breakView: BreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("BVC") as! BreakVC
        
        SystemStatus.sharedInstance.optionString = "p"
        
        self.presentViewController(breakView, animated: true, completion: nil)
        
        
    }

    @IBAction func noAction(sender: AnyObject) {
        
        var breakView: BreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("BVC") as! BreakVC
        
        SystemStatus.sharedInstance.optionString = "np"

        self.presentViewController(breakView, animated: true, completion: nil)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //CUSTOMIZING NAVIGATION BAR
        
        let swiftColor = UIColor(red: 163/255, green: 240/255, blue: 153/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor
        
        let backButton = UIBarButtonItem(title: "< back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack:")
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)
        
        //  ANIMATING BUTTONS
        
        //  yay
        yayView.frame = CGRect(x: self.width, y: 300, width:self.width*0.625, height:self.width*0.156)
        self.view.addSubview(yayView)
        UIView.animateWithDuration(0.7, delay:0.1, options: nil , animations: {
            
            self.yayView.backgroundColor = UIColor(red: 255, green: 173, blue: 115, alpha: 0.05)
            self.yayView.backgroundColor = UIColor.whiteColor()
            self.yayView.frame = CGRect(x:self.width*0.34, y:300, width:self.width*0.312, height: 50)
            
            }, completion: { finished in
                println(" home animation worked")
        })
        
        
        //  nay
        nayView.frame = CGRect(x: self.width, y:390, width:self.width*0.625, height:self.width*0.156)
        self.view.addSubview(nayView)
        UIView.animateWithDuration(0.7, delay:0.05, options: nil, animations: {
            
            self.nayView.backgroundColor = UIColor(red: 255, green: 173, blue: 115, alpha: 0.05)
            self.nayView.backgroundColor = UIColor.whiteColor()
            self.nayView.frame = CGRect(x:self.width*0.34, y:390 , width:self.width*0.312, height:self.width*0.156)
            
            }, completion: { finished in
                println(" work animation worked")
        })

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

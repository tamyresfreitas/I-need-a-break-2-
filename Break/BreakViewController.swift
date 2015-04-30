//
//  BreakViewController.swift
//  Break
//
//  Created by Beatriz Melo Mousinho Magalhães on 3/15/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController {

    
    
    //var teste = Break()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //teste.loadBreak("home", time:  "10",people:  "p")
        
        //descLabel.text = teste.dsc
        
        
    }

    @IBOutlet weak var descLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

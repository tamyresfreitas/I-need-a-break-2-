//
//  AnimationVC.swift
//  Break
//
//  Created by Tamyres Freitas on 4/1/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class AnimationVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
      let transitionManager = TransitionVC()
    
      var bg: UIImageView! = UIImageView()
    
    var screenShot:UIImage! = UIImage()
    var editedImage:UIImage! = UIImage()
     var imagePicker:UIImagePickerController! = UIImagePickerController()
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    

    @IBOutlet weak var stbImg: UIImageView!

@IBAction func cancelButton(sender: UIStoryboardSegue) {
    
    
        
        var breakView: BreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("BVC") as! BreakVC
        
        
        //self.presentViewController(breakView, animated: true, completion: nil)
   
    self.dismissViewControllerAnimated(true, completion: nil)
    

}
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraLabel: UILabel!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var homeLabel: UILabel!
    @IBAction func homeAction(sender: AnyObject) {
        
        

        
    }
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareLabel: UILabel!
    @IBAction func shareAction(sender: AnyObject) {
        var breakView: BreakVC = self.storyboard?.instantiateViewControllerWithIdentifier("BVC") as! BreakVC
        self.presentViewController(breakView, animated: true, completion: nil)
        

        
    }

    @IBAction func share(sender: AnyObject) {
        self.shootPhoto()
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.transitioningDelegate = self.transitionManager
        
        let button : UIButton = UIButton()
        var shareButton:FBSDKShareButton = FBSDKShareButton()
        
        shareButton.frame = CGRectMake(127, 50, 100, 50)
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("Choose Photo", forState: .Normal)
        button.frame = CGRectMake((UIScreen.mainScreen().bounds.width - 150) * 0.5, (5/6.0)*height - shareButton.frame.size.height/2, 100, 50)
        //button.addTarget(self, action: "photoBtnClicked", forControlEvents: .TouchUpInside)
        button.addTarget(self, action: "shootPhoto", forControlEvents: .TouchUpInside)
        
        //self.view.addSubview(button)
        //self.view.addSubview(shareButton)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        self.screenShot = self.screenShotMethod(self.view)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func setView1(obj:UIImage){
        

        bg = UIImageView()
        bg.image = obj
    }
    
     override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        bg.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        //bg.superview?.sendSubviewToBack(bg)
        bg.alpha = 0.5
        stbImg.image = bg.image
     
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        var newView:UIView! = UIView()
        newView.frame.size = self.view.frame.size
        
        var img1:UIImageView! = UIImageView()
        img1.image = self.screenShot
        img1.frame.size = self.view.frame.size
        
        var img2:UIImageView! = UIImageView()
        img2.image = (info[UIImagePickerControllerOriginalImage] as! UIImage)
        img2.frame = CGRectMake(0, self.view.frame.size.height * (1/3.0), self.view.frame.size.width, self.view.frame.size.height)
        newView.addSubview(img1)
        newView.addSubview(img2)
        
        self.editedImage = self.screenShotMethod(newView)
        
        let photo : FBSDKSharePhoto = FBSDKSharePhoto()
        photo.image = self.editedImage
        photo.userGenerated = true
        let content : FBSDKSharePhotoContent = FBSDKSharePhotoContent()
        content.photos = [photo]
        
        FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
        println("Posted photo")
        
    }
    //
    //    func photoBtnClicked(){
    //        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
    //
    //            imagePicker.delegate = self
    //            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
    //            imagePicker.allowsEditing = false
    //            self.presentViewController(imagePicker, animated: true, completion: nil)
    //
    //
    //        }
    //    }
    
    func shootPhoto() {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.cameraCaptureMode = .Photo
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        else {
            let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
            alertVC.addAction(okAction)
            presentViewController(alertVC, animated: true, completion: nil)
        }
        
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





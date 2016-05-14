//
//  Directions.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/30/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class Directions: UIViewController
{

    @IBOutlet weak var churchImage: UIImageView!
    @IBOutlet weak var eccImage: UIImageView!
    @IBOutlet weak var schoolImage: UIImageView!
    
    
    @IBAction func backButtonPressed(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func directionsToChurchButton(sender: AnyObject)
    {
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"http://maps.apple.com")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string:
            "http://maps.apple.com/?daddr=Grace+Lutheran+Early+Childhood+Center+Oak+Creek,+WI&saddr=Current%20Location")!)
        } else {
            NSLog("Can't use Apple Maps");
        }
    }
    
    @IBAction func directionsToSchoolButton(sender: AnyObject)
    {
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"http://maps.apple.com")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string:
                "http://maps.apple.com/?daddr=Grace+Lutheran+School+Oak+Creek,+WI&saddr=Current%20Location")!)
        } else {
            NSLog("Can't use Apple Maps");
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.churchImage.image = UIImage(named: "church.png")
        self.eccImage.image = UIImage(named: "ecc.png")
        self.schoolImage.image = UIImage(named: "school.png")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

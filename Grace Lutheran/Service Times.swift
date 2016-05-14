//
//  Service Times.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/18/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class Service_Times: UIViewController
{

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBAction func backButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.logoImage.image = UIImage(named: "lcmslogowwords.jpeg")

    }

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

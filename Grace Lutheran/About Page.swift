//
//  About Page.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 2/26/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit
import Alamofire

class About_Page: UIViewController
{

    @IBOutlet weak var logoImage: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.logoImage.image = UIImage(named: "gllogo.jpg")
       // logoImage. //set image as the logo
        // Do any additional setup after loading the view.
        

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//  More Page.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 2/26/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class More_Page: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var lcmsLogoImage: UIImageView!
    
    var theRow = -1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        PhoneCore.moreItems = ["Bible", "Prayers", "Newsletters", "Facebook", "Service Times"]
        self.lcmsLogoImage.image = UIImage(named: "lcms-logo.png")

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //table stuff
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return PhoneCore.moreItems.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel!.text = PhoneCore.moreItems[indexPath.row] as! String
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        if segue.identifier == "\(PhoneCore.moreItems[theRow])"
        {
            // Setup new view controller
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        theRow = indexPath.row
        self.performSegueWithIdentifier("\(PhoneCore.moreItems[theRow])", sender: self)

        
    }

}


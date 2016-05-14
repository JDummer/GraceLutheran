//
//  Newsletters.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/18/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class Newsletters: UIViewController
{

    @IBOutlet weak var newslettersWV: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func backButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadaddress()
    }

    func loadaddress()
    {
        let url = NSURL (string: "http://graceoakcreek.org/LinkClick.aspx?fileticket=IYoOyBRIJzs%3d&tabid=995")
        //let url = NSURL (string: "http://graceoakcreek.org/LinkClick.aspx?fileticket=OAuhpAD1lQU%3d&tabid=995")
        let requestObj = NSURLRequest(URL: url!)
        newslettersWV.loadRequest(requestObj)
    }
    
    func webViewDidStartLoad(_: UIWebView)
    {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_: UIWebView)
    {
        activityIndicator.stopAnimating()
    }
    func webView(_: UIWebView!, didFailLoadWithError error: NSError!)
    {
        activityIndicator.stopAnimating()
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

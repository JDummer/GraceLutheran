//
//  Prayers.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/18/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class Prayers: UIViewController
{

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var prayerListWebView: UIWebView!
    
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
        let url = NSURL (string: "http://graceoakcreek.org/Portals/graceoakcreek/Content%20Root/Docs/2016-01-25%20Weekly%20Prayer%20List.pdf#page=1&zoom=auto,-17,5")
        let requestObj = NSURLRequest(URL: url!)
        prayerListWebView.loadRequest(requestObj)
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

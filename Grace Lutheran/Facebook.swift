//
//  Facebook.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/18/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class Facebook: UIViewController
{

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func backButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadaddress()
    }

    func loadaddress()
    {
        //shows the url in the webView when called in viewDidLoad
        let url = NSURL (string: "https://www.facebook.com/Grace-Lutheran-Church-School-of-Oak-Creek-WI-108150349226557/?fref=ts")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

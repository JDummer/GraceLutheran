//
//  Daily Devotion Page.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 2/26/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class Daily_Devotion_Page: UIViewController {

    @IBOutlet weak var devotionWV: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadaddress()
    }
    
    func loadaddress()
    {
        let url = NSURL (string: "http://www.lhm.org/dailydevotions/")
        let requestObj = NSURLRequest(URL: url!)
        devotionWV.loadRequest(requestObj)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_: UIWebView) // here show your indicator
    {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_: UIWebView) // here hide it
    {
        activityIndicator.stopAnimating()
    }
    func webView(_: UIWebView!, didFailLoadWithError error: NSError!) // here hide it
    {
        activityIndicator.stopAnimating()
    }

}

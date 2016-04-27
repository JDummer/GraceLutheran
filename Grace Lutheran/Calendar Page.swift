//
//  Calendar Page.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 2/26/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class Calendar_Page: UIViewController
{

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var calendarWV: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        loadaddress()
    }

    func loadaddress()
    {
        let url = NSURL (string: "http://gracelutheran.view-events.com/calendar/calendar_events_list_view.aspx?list_by=week&ci=G1J4K5F0K5H2O9L6I3")
        let requestObj = NSURLRequest(URL: url!)
        calendarWV.loadRequest(requestObj)
    }
    
    override func didReceiveMemoryWarning()
    {
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

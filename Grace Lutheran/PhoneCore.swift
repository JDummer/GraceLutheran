//
//  PhoneCore.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 3/23/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit

class PhoneCore: NSObject
{
    static var moreItems = []
    static var bibleVerse = ""
    
    static func showAlert(title: String, Message: String, presentingViewController: UIViewController, onScreenDelay: Double)
    {
        let av = UIAlertController(title: "Error", message: Message, preferredStyle: UIAlertControllerStyle.Alert)
        presentingViewController.presentViewController(av, animated: true, completion: { () -> Void in
            let delay = onScreenDelay * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
                presentingViewController.dismissViewControllerAnimated(true, completion: nil)
            })
        })
    }

}

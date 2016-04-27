//
//  Submit Prayer.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/19/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit
import Alamofire

class Submit_Prayer: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var prayerTF: UITextField!
    @IBOutlet weak var prayerLineSwitch: UISwitch!
    @IBOutlet weak var includeInWorshipSwitch: UISwitch!
    
    var prayerline = ""
    var includeInWorship = ""
    
    
    @IBAction func prayerLineSwitchPressed(sender: AnyObject)
    {
        print(prayerLineSwitch.on)
    }

    @IBAction func includeInWorshipSwitchPressed(sender: AnyObject)
    {
        print(includeInWorshipSwitch.on)
    }
    
    @IBAction func backButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func submitButton(sender: AnyObject)
    {
        //to change true/false to yes/no when sending the email
        if(prayerLineSwitch.on)
        {
            prayerline = "Yes"
        }
        else
        {
            prayerline = "No"
        }
        
        if(includeInWorshipSwitch.on)
        {
            includeInWorship = "Yes"
        }
        else
        {
            includeInWorship = "No"
        }
        
        //mailgun key
        let key = "key-95d6d4daa09a819094ed4048a0b298ad"
        
        //html for the body of the email
        let emailBody = "<html><body>From: \(self.nameTF.text as String!) <br><br>Email: \(self.emailTF.text as String!) <br><br>Include in prayer line: \(prayerline) <br><br>Include in worship: \(includeInWorship) <br><br>Request: \(self.prayerTF.text as String!) <br><br><br>sent via the app (iOS)</body></html>"
        
        //parameters for the email
        let parameters = [
            "Authorization" : "api:key-95d6d4daa09a819094ed4048a0b298ad",
            "from": "mailgun@sandboxfadd6a8b666d4a0da2ad81102abdd93e.mailgun.org",
            "to": "brewers849@gmail.com",
            "subject": "Prayer Request from App",
            "html": "\(emailBody)"
        ]
        
        //actually POST request for sending the email
        let r = Alamofire.request(.POST, "https://api.mailgun.net/v3/sandboxfadd6a8b666d4a0da2ad81102abdd93e.mailgun.org/messages", parameters:parameters)
            .authenticate(user: "api", password: key)
            .response { (request, response, data, error) in
                print(request)
                print(response)
                print(error)
        }
        print(r)
    }
    
  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        nameTF.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

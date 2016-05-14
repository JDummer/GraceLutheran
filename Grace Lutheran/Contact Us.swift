//
//  Contact Us.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/29/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit
import Alamofire

class Contact_Us: UIViewController
{

    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var subjectTF: UITextField!
    @IBOutlet weak var messageTF: UITextField!
    @IBOutlet weak var relatedToPicker: UIPickerView!
    
    
    @IBAction func submitButton(sender: AnyObject)
    {
        
        //sets the message for the alert if the required boxes were not entered
        var message = ""
        
        if(self.fullNameTF.text!.characters.count == 0)
        {
            message = "Please enter your name"
        }
        else if(self.emailTF.text!.characters.count == 0)
        {
            message = "Please enter an email"
        }
        else if(self.subjectTF.text!.characters.count == 0)
        {
            message = "Please enter a subject"
        }
        else if(self.messageTF.text!.characters.count == 0)
        {
            message = "Please enter a message"
        }
        
        //shows an error if a box was left blank, otherwise it goes into the else statement
        if(message.characters.count != 0)
        {
            //there was a problem
            PhoneCore.showAlert("There was an error", Message: message, presentingViewController: self, onScreenDelay: 2)
        }
            
        else //if the text fields were filled in, we get into else
        {
            //mailgun key
            let key = "key-95d6d4daa09a819094ed4048a0b298ad"
            
            //html for the body of the email
            let emailBody = "<html><body>From: \(self.fullNameTF.text as String!) <br><br>Email: \(self.emailTF.text as String!) <br><br>Comment related to: \(commentRelatedTo)<br><br>Subject: \(self.subjectTF.text as String!) <br><br>The Message: \(self.messageTF.text as String!)<br><br><br>sent via the app (iOS)</body></html>"
            
            //parameters for the email
            let parameters = [
                "Authorization" : "api:key-95d6d4daa09a819094ed4048a0b298ad",
                "from": "mailgun@sandboxfadd6a8b666d4a0da2ad81102abdd93e.mailgun.org",
                "to": "brewers849@gmail.com",
                "subject": "Message from the app about: \(self.subjectTF.text as String!)",
                "html": "\(emailBody)"
            ]
            
            //actual POST request for sending the email
            let r = Alamofire.request(.POST, "https://api.mailgun.net/v3/sandboxfadd6a8b666d4a0da2ad81102abdd93e.mailgun.org/messages", parameters:parameters)
                .authenticate(user: "api", password: key)
                .response { (request, response, data, error) in
                    print(request)
                    print(response)
                    print(error)
            }
            print(r)
        }

    }
    
    
    @IBAction func backButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Submit_Prayer.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool)
    {
        self.fullNameTF.becomeFirstResponder()
    }

    let pickerData = ["Church", "School", "Early Childhood Center", "Website", "App", "General"]
    var commentRelatedTo = "Church"

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.commentRelatedTo = pickerData[row]
        print(commentRelatedTo)
        
        
    }





}

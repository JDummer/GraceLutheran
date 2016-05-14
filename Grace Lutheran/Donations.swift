//
//  Donations.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 4/18/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class Donations: UIViewController, PayPalPaymentDelegate
{
    
    @IBOutlet weak var donateButtonOutlet: UIButton!
    @IBOutlet weak var amountPicker: UIPickerView!
    
    
    /*
    * change the client id for sandbox and production
    */
    
   var payPalConfig = PayPalConfiguration()
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if(newEnvironment != newEnvironment) {
                PayPalMobile.preconnectWithEnvironment(newEnvironment)
            }
        }
    }
    
    var acceptCreditCards: Bool = true {
        didSet {
            payPalConfig.acceptCreditCards = acceptCreditCards
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

        
        
        payPalConfig.acceptCreditCards = acceptCreditCards
        payPalConfig.merchantName = "Grace Lutheran Church"
        payPalConfig.merchantPrivacyPolicyURL = NSURL(string: "") //insert url with Privacy Policy here
        payPalConfig.merchantUserAgreementURL = NSURL(string: "") //insert url with User Agreement here
        payPalConfig.languageOrLocale = NSLocale.preferredLanguages()[0] as! String
        payPalConfig.payPalShippingAddressOption = .PayPal
        
        PayPalMobile.preconnectWithEnvironment(environment)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController, didCompletePayment completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismissViewControllerAnimated(true, completion: { () -> Void in
            //send completed confirmation to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
        })
    }

 
    
    @IBAction func donateButton(sender: AnyObject)
    {
        //Process Payment once the pay button is clicked
        
        let item1 = PayPalItem(name: "Donation to Grace Lutheran", withQuantity: 1, withPrice: NSDecimalNumber(string: "9.99"), withCurrency: "USD", withSku: "GL-0001")
        
        let items = [item1]
        let subtotal = PayPalItem.totalPriceForItems(items)
        

        //Optional: include payment details
        let shipping = NSDecimalNumber(string: "0.00")
        let tax = NSDecimalNumber(string: "0.00")
 
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
 
        
        let total = subtotal.decimalNumberByAdding(shipping).decimalNumberByAdding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Donation to Grace Lutheran Church", intent: .Sale)
        
 
 
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if(payment.processable)
        {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            presentViewController(paymentViewController!, animated: true, completion: nil)
        }
        else
        {
            print("Payment not processable: \(payment)")
        }
    }


    let pickerDataInt = Array(0...100)
    let pickerDataString = String(0...100)
    let pickerData = ["", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$16", "$17", "$18", "$19", "$20", "$21", "$22", "$23", "$24", "$25", "$26", "$27", "$28", "$29", "$30", "$31", "$32", "$33", "$34", "$35", "$36", "$37", "$38", "$39", "$40", "$41", "$42", "$43", "$44", "$45", "$46", "$47", "$48", "$49", "$50", "$51", "$52", "$53", "$54", "$55", "$56", "$57", "$58", "$59", "$50", "$51", "$52", "$53", "$54", "$55", "$56", "$57", "$58", "$59", "$60", "$61", "$62", "$63", "$64", "$65", "$66", "$67", "$68", "$69", "$60", "$61", "$62", "$63", "$64", "$65", "$66", "$67", "$68", "$69", "$70", "$71", "$72", "$73", "$74", "$75", "$76", "$77", "$78", "$79", "$80", "$81", "$82", "$83", "$84", "$85", "$86", "$87", "$88", "$89", "$90", "$91", "$92", "$93", "$94", "$95", "$96", "$97", "$98", "$99", "$100"]
    
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
        //self.bookBucket = pickerDataForURL[row]
        //print(bookBucket)
        
        
    }
    
    
}

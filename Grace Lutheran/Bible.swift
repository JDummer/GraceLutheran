//
//  Bible.swift
//  Grace Lutheran
//
//  Created by Jonathan Dummer on 3/25/16.
//  Copyright © 2016 Grace Lutheran - Oak Creek. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Bible: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{

    @IBOutlet weak var bibleVerseLabel: UILabel!
    @IBOutlet weak var chapterTF: UITextField!
    @IBOutlet weak var verseTF: UITextField!
    @IBOutlet weak var bookPicker: UIPickerView!
    
    //for picker view with spaces to look nice
    //pickerData[0] is left blank to ensure the picker selects a bucket if the user picks Genesis
    let pickerData = ["", "Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy", "Joshua", "Judges", "Ruth", "1 Samuel", "2 Samuel", "1 Kings", "2 Kings", "1 Chronicles", "2 Chronicles", "Ezra", "Nehemiah", "Esther", "Job", "Psalms", "Proverbs", "Ecclesiastes", "Song of Solomon", "Isaiah", "Jeremiah", "Lametations", "Ezekiel", "Daniel", "Hosea", "Joel", "Amos", "Obadiah", "Jonah", "Micah", "Nahum", "Habakkuk", "Zephaniah", "Haggai", "Zechariah", "Malachi", "Matthew", "Mark", "Luke", "John", "Acts", "Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians", "Phillipians", "Colossians", "1 Thessalonians", "2 Thessalonians", "1 Timothy", "2 Timothy", "Titus", "Philemon", "Hebrews", "James", "1 Peter", "2 Peter", "1 John", "2 John", "3 John", "Jude", "Revelation"]
    
    //shortened and without spaces to use in the url
    //pickerDataForURL[0] left blank to keep with pickerData[]
    let pickerDataForURL = ["", "Gen", "Exod", "Lev", "Num", "Deut", "Josh", "Judg", "Ruth", "1Sam", "2Sam", "1Kgs", "2Kgs", "1Chr", "2Chr", "Ezra", "Neh", "Esth", "Job", "Ps", "Prov", "Eccl", "Song", "Isa", "Jer", "Lam", "Ezek", "Dan", "Hos", "Joel", "Amos", "Obad", "Jonah", "Mic", "Nah", "Hab", "Zeph", "Hag", "Zech", "Mal", "Matt", "Mark", "Luke", "John", "Acts", "Rom", "1Cor", "2Cor", "Gal", "Eph", "Phil", "Col", "1Thess", "2Thess", "1Tim", "2Tim", "Titus", "Phlm", "Heb", "Jas", "1Pet", "2Pet", "1John", "2John", "3John", "Jude", "Rev"]
    
    var bookBucket = ""
    var chapter = ""
    var verseNum = ""
    
    @IBAction func searchButton(sender: AnyObject)
    {
        //fix resignFirstResponder() so that it actually works
        self.resignFirstResponder()
        chapter = chapterTF.text! as String
        verseNum = self.verseTF.text! as String

        //key
        let key = "hFTAx85LRuCY8vAN48Atl9i5Evx5jhu4cGeI6hq3"
        let url = "https://bibles.org/v2/verses/eng-ESV:\(bookBucket).\(chapter).\(verseNum).js"
       /*
        let parameters = [
            "hFTAx85LRuCY8vAN48Atl9i5Evx5jhu4cGeI6hq3" : "hFTAx85LRuCY8vAN48Atl9i5Evx5jhu4cGeI6hq3"
        ]
       */
        
        let verse = Alamofire.request(.POST, url, encoding: .JSON)
            .authenticate(user: key, password: key)
            .responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                //print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                //example if there is an id
                let responseone = response.objectForKey("response")
                let verses = responseone?.objectForKey("verses")?.objectAtIndex(0)
                let text = verses?.objectForKey("text")
                //let str = text!.stringByReplacingOccurrencesOfString("(?i)</?\(tag)\\b[^<]*>", withString: "")
               // let str = text.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
                
                let htmlStringData = text!.dataUsingEncoding(NSUTF8StringEncoding)!
                
                let options: [String: AnyObject] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding]
                
                let attributedHTMLString = try! NSAttributedString(data: htmlStringData, options: options, documentAttributes: nil)
                
                let final = attributedHTMLString.string
                
                print(final)
                self.bibleVerseLabel.text = final as! String
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
                        print(verse)
    }
        /*
         chapter = self.chapterTF.text as String!
         verse = self.verseTF.text as String!
         let requestURL: NSURL = NSURL(string: "https://api.biblia.com/v1/bible/content/ASV.xml.json?passage=\(book)+\(self.chapter).\(self.verse)&key=1a890abc5191083853bfa91cf607d1a0")!
         let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
         let session = NSURLSession.sharedSession()
         let task = session.dataTaskWithRequest(urlRequest)
         {
         (data, response, error) -> Void in
         
         let httpResponse = response as! NSHTTPURLResponse
         let statusCode = httpResponse.statusCode
         
         if (statusCode == 200)
         {
         do
         {
         let json = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)
         
         print(json["text"] as! String)
         //self.bibleVerseLabel.text = json["text"] as! String
         PhoneCore.bibleVerse = json["text"] as! String
         //self.performSelectorOnMainThread(Selector("updatePostLabel:"), withObject: json["text"], waitUntilDone: false)
         
         //self.performselector
         
         }
         catch
         {
         print("Error with Json: \(error)")
         }
         
         }
         else
         {
         print(statusCode)
         }
         
         }
         
         task.resume()
         // self.performSegueWithIdentifier("bibleVerse", sender: self)
         
         //self.bibleVerseLabel.text = PhoneCore.bibleVerse
         //print("label set")
         
         */
    
    
    @IBAction func backButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //bookPicker.dataSource = self
        //bookPicker.delegate = self
        
        self.bibleVerseLabel.text = ""
        self.chapterTF.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        //self.garbage = pickerData[row]
        self.bookBucket = pickerDataForURL[row]
        print(bookBucket)
        //print(bookBucket)
        
    }
}

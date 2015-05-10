//
//  WebViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class WebViewController: UIViewController{
    //JQuery solution, no Javascript solution yet
    //http://stackoverflow.com/questions/5824079/using-important-in-jquerys-css-function
    //Possible Javascript solution
    //http://stackoverflow.com/questions/462537/overriding-important-style
    //Importing external stylesheet
    //http://makeapppie.com/2014/10/28/swift-swift-using-uiwebviews-in-swift/
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var defaults = ["textFontSize":12,"textFontColor":"blue", "backgroundColor":"black"]
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //headline.numberOfLines = 0
        //body.numberOfLines = 0
        self.navigationItem.title = appDelegate.getCurrArticle().category
        headline.text = appDelegate.getCurrArticle().articleName
        body.text = appDelegate.getCurrArticle().body.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
        headline.font = UIFont(name: headline.font.fontName, size: 28)
        //scrollView.addSubview(articleView)
        scrollView.contentSize=CGSizeMake(scrollView.contentSize.width, headline.frame.size.height+body.frame.size.height+30)
    }

    @IBAction func increaseFontSize(sender: AnyObject)
    {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let destViewController = segue.destinationViewController as! CustomizeViewController
    }
    
    @IBAction func goToCustomizeFromWebView(segue: UIStoryboardSegue) {
        performSegueWithIdentifier("custWebView", sender: self)
    }
}

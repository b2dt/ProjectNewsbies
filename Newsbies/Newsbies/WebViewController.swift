//
//  WebViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class WebViewController: UIViewController
{
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
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
        headline.font = UIFont.systemFontOfSize(CGFloat(appDelegate.getCurrentTheme().fontSize+8))
        headline.textColor = appDelegate.getCurrentTheme().fontColor
        body.font=UIFont.systemFontOfSize(CGFloat(appDelegate.getCurrentTheme().fontSize))
        body.textColor = appDelegate.getCurrentTheme().fontColor
        scrollView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
        //scrollView.addSubview(articleView)
        scrollView.contentSize=CGSizeMake(scrollView.contentSize.width, headline.frame.size.height+body.frame.size.height+30)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let destViewController = segue.destinationViewController as! CustomizeViewController
    }
    
    @IBAction func goToCustomizeFromWebView(segue: UIStoryboardSegue) {
        performSegueWithIdentifier("custWebView", sender: self)
    }
}

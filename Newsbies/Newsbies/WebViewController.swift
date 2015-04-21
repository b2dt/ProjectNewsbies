//
//  WebViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    //JQuery solution, no Javascript solution yet
    //http://stackoverflow.com/questions/5824079/using-important-in-jquerys-css-function
    //Possible Javascript solution
    //http://stackoverflow.com/questions/462537/overriding-important-style
    //Importing external stylesheet
    //http://makeapppie.com/2014/10/28/swift-swift-using-uiwebviews-in-swift/
    
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    var defaults = ["textFontSize":12,"textFontColor":"blue", "backgroundColor":"black"]
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var navBarTitle: UINavigationItem!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navBarTitle.title = appDelegate.getCurrArticle().category
        webView.loadRequest(NSURLRequest(URL: NSURL(string: appDelegate.getCurrArticle().webURL)!))
        var loadStyles = "var script = document.createElement('link'); script.type = 'text/css'; script.rel = 'stylesheet'; script.href = 'customCss.css';document.getElementsByTagName('body')[0].appendChild(script);"
        
        webView.stringByEvaluatingJavaScriptFromString(loadStyles)
    }

    @IBAction func increaseFontSize(sender: AnyObject)
    {
        //increaseWebViewFontSize(webView)
        changeFontColorToBlue(webView)
        changeWebViewBackgroundColor(webView)
    }
    
    func changeWebViewBackgroundColor(webView:UIWebView)
    {
        webView.opaque = false
        //webView.backgroundColor = UIColor.blackColor()
        var backgroundColor = defaults["backgroundColor"]! as NSString
        var jsString = "document.getElementsByTagName('html')[0].style.setProperty('background-color','blue','important')"
        webView.stringByEvaluatingJavaScriptFromString(jsString)
        
        var jsString2 = "document.getElementsByTagName('body')[0].style.setProperty('background-color','blue','important')"
        webView.stringByEvaluatingJavaScriptFromString(jsString2)
    }
    
    func changeFontColorToBlue(webView:UIWebView)
    {
        var textFontColor = defaults["textFontColor"]! as NSString
        var jsString = "document.getElementsByTagName('body')[0].style.setProperty('color','blue','important')"
        webView.stringByEvaluatingJavaScriptFromString(jsString)
    }
    
    func increaseWebViewFontSize(webView:UIWebView)
    {
        var textFontSizeTemp = defaults["textFontSize"]! as Int
        
        textFontSizeTemp  = textFontSizeTemp + 1
        
        defaults["textFontSize"] = textFontSizeTemp
        
        //.setAttribute('style', 'display:inline !important');
        //element.style.setProperty("display", "inline", "important")
        //element.setAttribute("style", "background-color: red;");
        var jsString = "document.getElementsByTagName('body')[0].style.setProperty('font-size','\(textFontSizeTemp)px','important')"
        //var jsString = "document.getElementsByTagName('body')[0].style.fontSize='\(textFontSizeTemp)px'"
        webView.stringByEvaluatingJavaScriptFromString(jsString)
    }

}

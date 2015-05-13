//
//  HomeViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate
{
    @IBOutlet weak var tView: UITableView!
    let prototypeCellIdentifier = "cell"
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var articleList = [Article]()
    var jsonParser: JsonParser = JsonParser()
    //var urlString:String = "http://api.nytimes.com/svc/search/v2/articlesearch.json?=new+york+times&api-key=5057b2a351479ebc6a1582e02270d75d:5:71571215"
    var urlString:String = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183771"
    var defaultFontFace = "comic sans"
    var defaultFontColor = UIColor(red: 0.02745, green: 0.18039, blue: 0.5921568, alpha: 1.0)
    var defaultFontSize = 16.0
    var defaultBackgroundColor = UIColor(red: 0.96470588, green: 0.968627451, blue: 0.8509803922, alpha: 1.0)
    //F7F5D9, 7 46 151
    //072e97 246 247 217
    override func viewDidLoad()
    {
        appDelegate.currTheme = Theme(fFace: defaultFontFace, fColor: defaultFontColor, fSize: defaultFontSize, bColor: defaultBackgroundColor)
        tView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
        super.viewDidLoad()
        //load json data and then put it in the cells of the table
        jsonParser.load(urlString) {
            (articles, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                // can do something about error here
                println(unwrappedErrorString)
            } else {
                self.tView.reloadData()
            }
        }
        //appDelegate.setCurArticleByIndex(0)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.articlesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        println("Setting the article title of \(appDelegate.articlesList[indexPath.row].articleName)")
        let cell = tView.dequeueReusableCellWithIdentifier(prototypeCellIdentifier) as! UITableViewCell
        
        cell.textLabel?.text = appDelegate.articlesList[indexPath.row].articleName
        cell.textLabel?.textColor = appDelegate.getCurrentTheme().fontColor
        cell.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
        cell.textLabel!.font = UIFont.systemFontOfSize(CGFloat(appDelegate.getCurrentTheme().fontSize+8))
        cell.detailTextLabel?.text = appDelegate.articlesList[indexPath.row].category
        cell.detailTextLabel?.textColor = appDelegate.getCurrentTheme().fontColor
        cell.detailTextLabel!.font = UIFont.systemFontOfSize(CGFloat(appDelegate.getCurrentTheme().fontSize))
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("Selected row. Setting Article")
        appDelegate.setCurArticleByIndex(indexPath.row)
        performSegueWithIdentifier("segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        println("preparing in tableViewController for segue")
        if(segue.identifier=="customize")
        {
            let destViewController = segue.destinationViewController as! CustomizeViewController
        }
        else if (segue.identifier=="segue")
        {
            let destViewController = segue.destinationViewController as! WebViewController
        }
    }

    @IBAction func goToCustomize(segue: UIStoryboardSegue) {
        performSegueWithIdentifier("customize", sender: self)
    }
}
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
    var themeFilePath: String?
    
    //F7F5D9, 7 46 151
    //072e97 246 247 217
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
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
        cell.textLabel!.font = UIFont(name: appDelegate.getCurrentTheme().fontFace, size: CGFloat(appDelegate.getCurrentTheme().fontSize+8))
        cell.detailTextLabel?.text = appDelegate.articlesList[indexPath.row].category
        cell.detailTextLabel?.textColor = appDelegate.getCurrentTheme().fontColor
        cell.detailTextLabel!.font = UIFont(name: appDelegate.getCurrentTheme().fontFace, size: CGFloat(appDelegate.getCurrentTheme().fontSize))
        
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
    
    override func viewWillAppear(animated: Bool)
    {
        tView.reloadData()
    }
}
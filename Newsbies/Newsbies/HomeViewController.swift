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
    var urlString:String = "http://api.nytimes.com/svc/search/v2/articlesearch.json?=new+york+times&api-key=5057b2a351479ebc6a1582e02270d75d:5:71571215"
    
    override func viewDidLoad()
    {
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
        let cell = tView.dequeueReusableCellWithIdentifier(prototypeCellIdentifier) as UITableViewCell
        
        cell.textLabel?.text = appDelegate.articlesList[indexPath.row].articleName
        
        cell.detailTextLabel?.text = appDelegate.articlesList[indexPath.row].category
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("Selected row. Setting Article")
        appDelegate.setCurArticleByIndex(indexPath.row)
        performSegueWithIdentifier("segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("preparing in tableViewController for segue")
        
        let destViewController = segue.destinationViewController as WebViewController
    }
    
    @IBAction func returnToHome(segue: UIStoryboardSegue) {
        println("return to HomeViewController")
    }
}
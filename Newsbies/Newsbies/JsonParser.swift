//
//  JsonParser.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//


/*
Hey there!

So I have set up a simple JSON exporter on an Amazon EC2 server. It can return a set of articles in a JSON array (up to 200 per request) based on the article ids.

In this URL http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids={x},{y} swap x with an article ID to start from and y with en article ID to end with.

So for example this query http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183802 would return an array of objects, one object per article, with headline, article body, pub date, urls for photos, etc. The object structure should be pretty straightforward, but let me know if you have any questions.

You can get an article ID by opening any article on Missourian, it's a number in the URL after /a/ and before the name of an article.

So far usability is limited to only exporting arrays of articles. If you need a single article though, you can get it by putting same ID for both xand y. Then an array would have only one object in it.

Let me know if this would be enough or if you are looking for something more flexible.

Oh, and also - I copied our SQL database from one of our latest dumps to that Amazon server, so it doesn't have most recent articles. Most recent article is the one with ID 185532, which is from February 23 this year. Also just let me know if you would need access to a more relevant database.
*/
import Foundation
import UIKit
class JsonParser: NSObject
{
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func load(fromURLString: String, completionHandler: (JsonParser, String?) -> Void) {
        if let url = NSURL(string: fromURLString) {
            let urlRequest = NSMutableURLRequest(URL: url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(urlRequest, completionHandler: {
                (data, response, error) -> Void in
                if error != nil {
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(self, error.localizedDescription)
                    })
                } else {
                    self.parse(data, completionHandler: completionHandler)
                }
            })
            
            task.resume()
        } else {
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(self, "Invalid URL")
            })
        }
    }
    
    /*func parse(jsonData: NSData, completionHandler: (JsonParser, String?) -> Void)
    {
        var jsonError: NSError?
        
        if let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSDictionary
        {
            if (jsonResult.count > 0)
            {
                if let status = jsonResult["status"] as? String
                {
                    if (status == "OK")
                    {
                        if let responseData = jsonResult["response"] as? NSDictionary
                        {
                            if let articleData = responseData["docs"] as? NSArray
                            {
                                for artData in articleData
                                {
                                    if let webUrl = artData["web_url"] as? NSString
                                    {
                                        if let category = artData["section_name"] as? NSString
                                        {
                                            if let headline = artData["headline"] as? NSDictionary
                                            {
                                                if let headliner = headline["main"] as? NSString
                                                {
                                                    appDelegate.articlesList.append(Article(artName: headliner as String, url: webUrl as String, artCategory: category as String))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHandler(self, nil)
                        })
                    }
                }
            }
            
        } else {
            if let unwrappedError = jsonError {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(self, "\(unwrappedError)")
                })
            }
        }
    }*/
    
    func parse(jsonData: NSData, completionHandler: (JsonParser, String?) -> Void)
    {
        var jsonError: NSError?
        
        if let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSArray
        {
            if (jsonResult.count > 0)
            {
                for artData in jsonResult
                {
                    for(key, value) in artData as! NSDictionary
                    {
                        let idNum = key as! String
                        if let article = artData[idNum] as? NSDictionary
                        {
                            if let body = article["body"] as? NSString
                            {
                                if let category = article["sect_hed"] as? NSString
                                {
                                    if let title = article["headline"] as? NSString
                                    {
                                        appDelegate.articlesList.append(Article(artName: title as String, artBody: body as String, artCategory: category as String))
                                        println("\(title) + \(category) + \(body)")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(self, nil)
            })
            
        } else {
            if let unwrappedError = jsonError {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(self, "\(unwrappedError)")
                })
            }
        }
    }
    
}
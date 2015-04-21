//
//  JsonParser.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import Foundation
import UIKit
class JsonParser: NSObject
{
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
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
                    self.parse(data, completionHandler)
                }
            })
            
            task.resume()
        } else {
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(self, "Invalid URL")
            })
        }
    }
    
    func parse(jsonData: NSData, completionHandler: (JsonParser, String?) -> Void) {
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
                                                    appDelegate.articlesList.append(Article(artName: headliner, url: webUrl, artCategory: category))
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
    }
    
}
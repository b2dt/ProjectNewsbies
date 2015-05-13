//
//  Customization.swift
//  Newsbies
//
//  Created by University of Missouri on 5/11/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class Customization: NSObject {
    
    class func getTheme() -> [Theme] {
        
        // Find the Library directory
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        
        // Get the last object out of this array, this is the URL
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        if let libraryURL = libraryURLOptional {
            var libraryPath = libraryURL.path?.stringByAppendingPathComponent("Design.json")
            if libraryPath != nil {
                
                let fileExists = NSFileManager.defaultManager().fileExistsAtPath(libraryPath!)
                if !fileExists {
                    let themeJSONData = Customization.loadThemesFromBundle()
                    Customization.processJSONData(themeJSONData)
                }
                
                let themes = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryPath!) as! [Theme]
                return themes
            }
        }
        
        return [Theme]()
    }
    
    class func processJSONData(data:NSData) {
        let themesJSON = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
        var themes = [Theme]()
        if let rootDictionary = themesJSON.objectForKey("themes") as? NSArray {
            for themeDictionary in rootDictionary {
                let show = Theme()
                
                if let fontFace = themeDictionary.objectForKey("fontFace") as? String {
                    show.fontFace = fontFace
                }
                
                if let fontColor = themeDictionary.objectForKey("fontColor") as? UIColor {
                    show.fontColor = fontColor                }
                
                if let fontSize = themeDictionary.objectForKey("fontSize") as? Double {
                    show.fontSize = fontSize
                }
                
                if let backgroundColor = themeDictionary.objectForKey("backgroundColor") as? UIColor {
                    show.backgroundColor = backgroundColor
                }
                themes.append(show)
            }
        }
        
        // archive to disk
        var error:NSErrorPointer?
        let mainBundle = NSBundle.mainBundle()
        // Find the Library directory
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        
        // Get the last object out of this array, this is the URL
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        if let libraryURL = libraryURLOptional {
            var libraryPath = libraryURL.path?.stringByAppendingPathComponent("Design.json")
            NSKeyedArchiver.archiveRootObject(themes, toFile: libraryPath!)
        }
        
        
    }
    
    class func loadThemesFromBundle() -> NSData {
        var error:NSErrorPointer?
        let mainBundle = NSBundle.mainBundle()
        let pathForDataFromBundle = mainBundle.pathForResource("Design", ofType: "json")
        let dataFromBundle = NSFileManager.defaultManager().contentsAtPath(pathForDataFromBundle!)
        return dataFromBundle!
    }

    
    
}

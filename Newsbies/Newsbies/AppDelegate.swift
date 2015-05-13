//
//  AppDelegate.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var themeFilePath: String?
    var window: UIWindow?
    var articlesList=Array<Article>()
    var themes=Array<Theme>()
    var currArticle: Article?
    var currTheme = Theme(fFace: "MarkerFelt-Thin", fColor: UIColor(red: 0.02745, green: 0.18039, blue: 0.5921568, alpha: 1.0), fSize: 16.0, bColor: UIColor(red: 0.96470588, green: 0.968627451, blue: 0.8509803922, alpha: 1.0))
    
    func getCurrentTheme() -> Theme
    {
        return currTheme
    }
    
    func setCurArticleByIndex(index:Int)
    {
        currArticle = articlesList[index]
    }
    
    func getCurrArticle() -> Article
    {
        return currArticle!
    }
    
    func getThemeFilePath()-> String
    {
        return themeFilePath!
    }
    
    func getThemes()->[Theme]
    {
        return themes
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//
//  Article.swift
//  Newsbies
//
//  Created by Brent Thoenen on 3/31/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import Foundation
class Article: NSObject
{
    var articleName: String
    var category:String
    //var webURL:String
    var body:String
    
    init(artName: String, artBody: String, artCategory: String)
    {
        articleName = artName
        //webURL = url
        body = artBody
        category = artCategory
    }
}
//
//  Theme.swift
//  Newsbies
//
//  Created by University of Missouri on 5/9/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class Theme: NSObject, NSCoding {
    var fontFace: String!
    var fontColor: UIColor!
    var fontSize: Double!
    var backgroundColor: UIColor!
    
    
    convenience init(fFace:String, fColor:UIColor, fSize:Double, bColor:UIColor)
    {
        self.init()
        self.fontFace = fFace
        self.fontColor = fColor
        self.fontSize = fSize
        self.backgroundColor = bColor
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.fontFace = decoder.decodeObjectForKey("fontFace") as! String
        self.fontColor = decoder.decodeObjectForKey("fontColor") as! UIColor
        self.fontSize = decoder.decodeDoubleForKey("fontSize") as Double
        self.backgroundColor = decoder.decodeObjectForKey("backgroundColor") as! UIColor
    }

    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.fontFace, forKey: "fontFace")
        coder.encodeObject(self.fontColor, forKey: "fontColor")
        coder.encodeDouble(self.fontSize, forKey: "fontSize")
        coder.encodeDouble(self.fontSize, forKey: "fontSize")
        coder.encodeObject(self.backgroundColor, forKey: "backgroundColor")
    }

}

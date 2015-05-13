//
//  ThemeHandler.swift
//  Newsbies
//
//  Created by Tyten Teegarden on 5/13/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class ThemeHandler: NSObject {

	func saveNewThemeWithFont(font:UIFont, backgroundColor:UIColor, textColor:UIColor) {
		let newTheme = Theme(fFace: font.fontName, fColor: textColor, fSize: Double(font.pointSize), bColor: backgroundColor)
		var themes = getThemesFromStorage()
		themes.append(newTheme)
		writeThemesToDisk(themes)

	}

	func getThemesFromStorage() -> [Theme] {
		// Find the Library directory
		let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)

		// Get the last object out of this array, this is the URL
		let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL

		// If not nil, proceed
		if let libraryURL = libraryURLOptional {
			var libraryPath = libraryURL.path?.stringByAppendingPathComponent("themes.data")
			if libraryPath != nil {

				let fileExists = NSFileManager.defaultManager().fileExistsAtPath(libraryPath!)


				if !fileExists {
					initializeThemesList()
				}

				let themes = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryPath!) as! [Theme]
				return themes
			}
		}
		return [Theme]()
	}


	// If the file doesn't exist, this is where you can create it!
	func initializeThemesList() {
		// At the very end of this, archive the themes to disk.
		let firstTheme = Theme(fFace: "Hoefler Text-Italic", fColor: UIColor(red: 0.313725, green: 0.541176, blue: 0.160784, alpha: 1.0), fSize: 14.0, bColor: UIColor(red: 0.66274, green: 0.96078, blue: 0.73725, alpha: 1.0))
        
		let secondTheme = Theme(fFace: "Papyrus", fColor: UIColor(red: 0.00392, green: 0.00392, blue: 0.87450, alpha: 1.0), fSize: 18.0, bColor: UIColor(red: 1.0, green: 0.50196, blue: 0.0, alpha: 1.0))
        
        let thirdTheme = Theme(fFace: "HelveticaNeue-UltraLight", fColor: UIColor.whiteColor(), fSize: 12.0, bColor: UIColor.blackColor())
        
        let fourthTheme = Theme(fFace: "MarkerFelt-Thin", fColor: UIColor(red: 0.99607, green: 0.18039, blue: 0.60392, alpha: 1.0), fSize: 16.0, bColor: UIColor(red: 0.50196, green: 0.0, blue: 1.0, alpha: 1.0))

		writeThemesToDisk([firstTheme, secondTheme, thirdTheme, fourthTheme])
	}

	func writeThemesToDisk(themes:[Theme]) {
		var error:NSErrorPointer?

		// Find the Library directory
		let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)

		// Get the last object out of this array, this is the URL
		let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL

		// If not nil, proceed
		if let libraryURL = libraryURLOptional {
			var libraryPath = libraryURL.path?.stringByAppendingPathComponent("themes.data")
			NSKeyedArchiver.archiveRootObject(themes, toFile: libraryPath!)
		}
	}

	/*
  
 // archive to disk
	var error:NSErrorPointer?
	let mainBundle = NSBundle.mainBundle()
	// Find the Library directory
	let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)

	// Get the last object out of this array, this is the URL
	let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL

	// If not nil, proceed
	if let libraryURL = libraryURLOptional {
	var libraryPath = libraryURL.path?.stringByAppendingPathComponent("StarTrek.json")
	NSKeyedArchiver.archiveRootObject(episodes, toFile: libraryPath!)
	}

*/
}

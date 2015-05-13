//
//  CustomizeViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/9/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class CustomizeViewController: UIViewController, ChildTextViewControllerDelegate{

    @IBOutlet var tView: UIView!
    @IBOutlet weak var sampleText: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var TextView: UIView!
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var ThemeView: UIView!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    struct Constants
    {
        static let textSegue="text"
        static let backgroundSegue="background"
        static let themeSegue="theme"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleText.textColor=appDelegate.getCurrentTheme().fontColor
        sampleText.font = UIFont(name: appDelegate.getCurrentTheme().fontFace, size: CGFloat(appDelegate.getCurrentTheme().fontSize))
        tView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor

        TextView.hidden=false
        BackgroundView.hidden=true
        ThemeView.hidden=true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl)
    {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            TextView.hidden = false
            BackgroundView.hidden = true
            ThemeView.hidden=true
        case 1:
            TextView.hidden = true
            BackgroundView.hidden = false
            ThemeView.hidden=true
        case 2:
            TextView.hidden = true
            BackgroundView.hidden = true
            ThemeView.hidden=false
        default:
            TextView.hidden = false
            BackgroundView.hidden = true
            ThemeView.hidden=true
        }
    }
    
    @IBAction func doneButtonPressed()
    {
        let newFontFace = sampleText.font.fontName
        let newBackgroundColor = sampleText.backgroundColor
        let newFontColor = sampleText.textColor
        let newFontSize = sampleText.font.pointSize
        
        appDelegate.currTheme = Theme(fFace: newFontFace, fColor: newFontColor, fSize: Double(newFontSize), bColor: newBackgroundColor!)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier==Constants.textSegue
        {
            let childViewController = segue.destinationViewController as! TextViewController
            childViewController.delegate = self
        }
    }
    
    func childTextViewControllerDidPressButton(childViewController: TextViewController)
    {
        //sampleText.font = UIFont(name: sampleText.font.fontName, size: sampleText.font.pointSize+2)
        sampleText.backgroundColor = UIColor.blueColor()
    }
}

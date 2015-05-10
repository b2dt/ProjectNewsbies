//
//  CustomizeViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/9/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class CustomizeViewController: UIViewController, ChildTextViewControllerDelegate, ChildBackgroundViewControllerDelegate, ChildThemeViewControllerDelegate{

    @IBOutlet weak var sampleText: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var TextView: UIView!
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var ThemeView: UIView!
    
    struct Constants {
        static let textSegue="text"
        static let backgroundSegue="background"
        static let themeSegue="theme"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleText.text = "Text"
        TextView.hidden=false
        BackgroundView.hidden=true
        ThemeView.hidden=true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl)
    {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            sampleText.text = "Text"
            TextView.hidden = false
            BackgroundView.hidden = true
            ThemeView.hidden=true
        case 1:
            sampleText.text = "Background"
            TextView.hidden = true
            BackgroundView.hidden = false
            ThemeView.hidden=true
        case 2:
            sampleText.text = "Themes"
            TextView.hidden = true
            BackgroundView.hidden = true
            ThemeView.hidden=false
        default:
            sampleText.text = "Text"
            TextView.hidden = false
            BackgroundView.hidden = true
            ThemeView.hidden=true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == Constants.textSegue)
        {
            let childViewController = segue.destinationViewController as! TextViewController
            //childViewController.delegate = self
        }
        else if(segue.identifier == Constants.backgroundSegue)
        {
            let childViewController = segue.destinationViewController as! BackgroundViewController
            childViewController.delegate = self
        }
        else if(segue.identifier == Constants.themeSegue)
        {
            let childViewController = segue.destinationViewController as! ThemeViewController
            //childViewController.delegate = self
        }
    }
    
    func childViewControllerDidPressButton(childViewController: BackgroundViewController)
    {
        sampleText.backgroundColor=UIColor.blueColor()
    }
}

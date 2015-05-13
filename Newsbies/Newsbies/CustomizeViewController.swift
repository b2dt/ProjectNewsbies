//
//  CustomizeViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/9/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class CustomizeViewController: UIViewController {

    @IBOutlet weak var sampleText: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var TextView: UIView!
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var ThemeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleText.text = "Text"
        BackgroundView.hidden=true
        ThemeView.hidden=true
        let MyBC = HRBrightnessCursor()
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
            break;
        }
    }
}
